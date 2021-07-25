import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/core/model/dynamic_model.dart';
import 'package:flutter_wechat/core/utils/utils.dart';
import 'package:flutter_wechat/ui/components/picture_preview.dart';
import 'package:flutter_wechat/ui/pages/user_info/user_info.dart';

class ItemContext extends StatelessWidget {
  final DynamicModel dynamic;

  const ItemContext({Key? key, required this.dynamic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 32.0.px,
        top: 32.0.px,
        right: 32.0.px,
        bottom: 22.0.px,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffe5e5e5)
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: ClipRRect(
              child: Image.network(
                dynamic.userInfo!.avatarUrl,
                width: 108.0.px,
                height: 108.0.px,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0.px)
            ),
            onTap: () {
              Navigator.of(context).pushNamed(UserInfoPage.routerName, arguments: dynamic.userInfo);
            },
          ),
          SizedBox(width: 26.0.px,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dynamic.userInfo!.name,
                  style: TextStyle(
                    fontSize: 42.0.px,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff586b95),
                  ),
                ),
                SizedBox(height: 30.0.px,),
                Text(
                  dynamic.content!,
                  style: TextStyle(
                    fontSize: 42.0.px,
                    height: 1.4,
                    color: Color(0xff191919),
                  ),
                ),
                SizedBox(height: 30.0.px,),
                _buildImages(context),
                SizedBox(height: 30.0.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // dynamic.timestamp!.toString(),
                      timeFilter(dynamic.timestamp!),
                      style: TextStyle(
                        fontSize: 30.0.px,
                        color: Color(0xff7f7f7f),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 86.0.px,
                        height: 54.0.px,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xfff8f8f8),
                          borderRadius: BorderRadius.circular(10.0.px),
                        ),
                        child: Icon(
                          Icons.more_horiz,
                          color: Color(0xff586b95),
                          size: 50.0.px,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImages(BuildContext context) {
    if (dynamic.images!.length == 1) {
      return PicturePreviewComponent(
        imagePath: dynamic.images![0],
        child: Image.network(
          dynamic.images![0],
          width: 540.0.px,
          height: 540.0.px,
          fit: BoxFit.cover,
        ),
      );
    } else {
      double clientWidth = MediaQuery.of(context).size.width - 64.0.px - 26.0.px - 108.0.px;
      double gridViewHeight = (clientWidth - 16.0.px) / 3 * (dynamic.images!.length / 3).ceil() + 3;
      return Container(
        width: clientWidth,
        height: gridViewHeight,
        child: GridView(
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8.0.px,
            crossAxisSpacing: 8.0.px,
            childAspectRatio: 1,
          ),
          children: List.generate(dynamic.images!.length, (index) {
            return PicturePreviewComponent(
              imagePath: dynamic.images![index],
            );
          }),
        ),
      );
    }
  }
}
