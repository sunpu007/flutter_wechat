import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class CropImage extends StatefulWidget {
  final File image;

  const CropImage({Key? key, required this.image}) : super(key: key);

  @override
  _CropImageState createState() => _CropImageState();
}

class _CropImageState extends State<CropImage> {
  final _cropKey = GlobalKey<CropState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xff1a1a1a),
            alignment: Alignment.center,
            child: Container(
              width: 951.0.px,
              height: 1586.0.px,
              color: Color(0xff1a1a1a),
              child: Crop.file(
                widget.image,
                key: _cropKey,
                aspectRatio: 1.0,
                alwaysShowGrid: false,
              ),
            ),
          ),
          Positioned(
            bottom: 64.0.px,
            child: Container(
              // width: double.infinity,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 65.0.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(
                      '取消',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context, '');
                    },
                  ),
                  MaterialButton(
                    minWidth: 162.0.px,
                    height: 88.0.px,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text('确定', style: TextStyle(fontSize: 44.0.px),),
                    onPressed: () {
                      _crop(widget.image);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ));
  }

  Future<void> _crop(File originalFile) async {
    final crop = _cropKey.currentState;
    final area = crop!.area;
    if (area == null) {
      //裁剪结果为空
      print('裁剪不成功');
      return;
    }
    await ImageCrop.requestPermissions().then((value) {
      if (value) {
        ImageCrop.cropImage(
          file: originalFile,
          area: area,
        ).then((value) {
          print(value);
          Navigator.pop<File>(context, value);
        }).catchError((err) {
          print('裁剪不成功');
        });
      } else {
        Navigator.pop<File>(context, originalFile);
      }
    });
  }
}
