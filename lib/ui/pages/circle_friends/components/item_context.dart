import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/ui/components/picture_preview.dart';

class ItemContext extends StatelessWidget {
  const ItemContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double clientWidth = MediaQuery.of(context).size.width - 64.0.px - 26.0.px - 108.0.px;
    double gridViewHeight = (clientWidth - 16.0.px) / 3 * (5 / 3).ceil() + 3;
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
          ClipRRect(
            child: Image.network(
              'https://img1.baidu.com/it/u=3911370551,3498254142&fm=26&fmt=auto&gp=0.jpg',
              width: 108.0.px,
              height: 108.0.px,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0.px)
          ),
          SizedBox(width: 26.0.px,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '许三多',
                  style: TextStyle(
                    fontSize: 42.0.px,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff586b95),
                  ),
                ),
                SizedBox(height: 30.0.px,),
                Text(
                  '活着就是做有意义的事；有意义的事就是好好活着',
                  style: TextStyle(
                    fontSize: 42.0.px,
                    height: 1.4,
                    color: Color(0xff191919),
                  ),
                ),
                SizedBox(height: 30.0.px,),
                Container(
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
                    children: [
                      PicturePreviewComponent(
                        imagePath: 'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
                      ),
                      PicturePreviewComponent(
                        imagePath: 'https://bkimg.cdn.bcebos.com/pic/43a7d933c895d143a97833e376f082025baf07e7?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg',
                      ),
                      PicturePreviewComponent(
                        imagePath: 'https://img1.baidu.com/it/u=3911370551,3498254142&fm=26&fmt=auto&gp=0.jpg',
                      ),
                      PicturePreviewComponent(
                        imagePath: 'https://bkimg.cdn.bcebos.com/pic/d788d43f8794a4c2816f19cc04f41bd5ac6e398d?x-bce-process=image/resize,m_lfit,w_235,h_235,limit_1/format,f_auto',
                      ),
                      PicturePreviewComponent(
                        imagePath: 'https://bkimg.cdn.bcebos.com/pic/b58f8c5494eef01f7bb979b5e0fe9925bc317d14?x-bce-process=image/resize,m_lfit,w_440,limit_1/format,f_auto',
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 30.0.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1分钟前',
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
}
