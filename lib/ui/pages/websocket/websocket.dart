import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/model/socket_model.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class WebSocketPage extends StatefulWidget {
  static const String routerName = '/websocket';

  const WebSocketPage({ Key? key }) : super(key: key);

  @override
  _WebSocketPageState createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {

  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://admin-demo.myjerry.cn/ws'),
  );

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: AppBar(
          title: Text('websocket'),
        ),
      ),
      body: StreamBuilder(
        stream: _channel.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.hasData ? snapshot.data : {};
            SocketModel socketModel = SocketModel.fromJson(json.decode(data.toString()));
            return Padding(
              padding: EdgeInsets.all(43.0.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('系统：${socketModel.sys!.sys.toString()}', style: TextStyle(fontSize: 44.0.px, height: 2),),
                  Text('IP：${socketModel.sys!.ip.toString()}', style: TextStyle(fontSize: 44.0.px, height: 2),),
                  Text('系统时间：${socketModel.time.toString()}', style: TextStyle(fontSize: 44.0.px, height: 2),),
                  Text('系统运行时间：${socketModel.sys!.date.toString()}', style: TextStyle(fontSize: 44.0.px, height: 2),),
                  Text('CPU占用率：${socketModel.cpu!.used.toString()}%', style: TextStyle(fontSize: 44.0.px, height: 2),),
                  Text('内存占用率：${socketModel.mem!.usageRate.toString()}%', style: TextStyle(fontSize: 44.0.px, height: 2),),
                  Text('磁盘使用率：${socketModel.disk!.usageRate.toString()}%', style: TextStyle(fontSize: 44.0.px, height: 2),),
                  Text('系统5m负载：${socketModel.sys!.loadavg5m.toString()}%', style: TextStyle(fontSize: 44.0.px, height: 2),),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}