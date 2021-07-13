import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/model/language_model.dart';
import 'package:flutter_wechat/core/services/json_parse.dart';
import 'package:flutter_wechat/generated/l10n.dart';
import 'package:flutter_wechat/ui/components/list_nav_item.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class LanguagePage extends StatefulWidget {
  static const String routerName = '/language';

  const LanguagePage({ Key? key }) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  List<LanguageModel> _languages = [];

  @override
  void initState() {
    super.initState();
    JsonParse.getLanguagesData().then((res) {
      setState(() {
        _languages = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: AppBar(
          title: Text(S.of(context).language),
          // actions: [
          //   MaterialButton(
          //     height: 0.5,
          //     color: Color(0xff07c160),
          //     child: Text('保存', style: TextStyle(fontSize: 44.0.px, color: Colors.white),),
          //     onPressed: () {},
          //   ),
          // ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(43.0.px, 0, 0, 0),
        itemCount: _languages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 45.0.px),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffd8d8d8),
                  width: 2.0.px
                )
              ),
            ),
            child: Text(_languages[index].countryName.toString(), style: TextStyle(fontSize: 44.0.px),)
          );
        },
      ),
    );
  }
}