import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/model/address_books_model.dart';
import 'package:flutter_wechat/core/services/json_parse.dart';
import 'package:flutter_wechat/ui/components/main_appbar.dart';
import 'package:flutter_wechat/ui/pages/address_book/classification.dart';
import 'package:flutter_wechat/ui/pages/address_book/contact_person.dart';
import 'package:flutter_wechat/ui/pages/user_info/user_info.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class AddressBook extends StatefulWidget {
  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  final double _iconWidth = 108.0.px;

  List<String> _letters = <String>[];

  List<AddressBooksModel> _addressBooks = [];

  @override
  void initState() {
    super.initState();
    List<String> letters = [];
    for (int i = 65; i < 91; i++) {
      letters.add(utf8.decode([i]));
    }
    setState(() {
      _letters = letters;
    });
    JsonParse.getAddressBooksData().then((res) {
      setState(() {
        _addressBooks = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: MainAppBarComponent('通讯录'),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            children: <Widget>[
              ..._buildNavContactPerson(),
              Classification(title: '我的企业及企业联系人'),
              ContactPerson(
                title: '企业微信联系人',
                icon: Container(
                  alignment: Alignment.center,
                  width: _iconWidth,
                  height: _iconWidth,
                  decoration: BoxDecoration(
                    color: Color(0xff2781d7),
                    borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
                  ),
                  child: Image.asset(
                    'assets/images/enterprise_wechat.png',
                    width: _iconWidth * 0.6,
                    height: _iconWidth * 0.6,
                    fit: BoxFit.cover,
                  ),
                ),
                isShowBottomBorder: false,
              ),
              ..._buildList(),
            ],
          ),
          Positioned(
            right: 23.0.px,
            child: Column(
              children: [
                ..._letters.map((e) => Text(e, key: ValueKey(e), style: TextStyle(fontSize: 34.0.px, height: 1.2),),),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgetList = [];

    _addressBooks.forEach((AddressBooksModel item) {
      widgetList.add(Classification(title: item.letter),);
      for (int i = 0; i < item.children.length; i++) {
        widgetList.add(ContactPerson(
          key: ValueKey(item.children[i].userId),
          title: item.children[i].name,
          icon: Image.network(
            item.children[i].avatarUrl,
            width: _iconWidth,
            height: _iconWidth,
            fit: BoxFit.cover,
          ),
          isShowBottomBorder: i != item.children.length - 1,
          jumpPath: UserInfoPage.routerName,
          jumpArguments: item.children[i],
        ));
      }
    });

    return widgetList;
  }

  List<Widget> _buildNavContactPerson() {
    return [
      ContactPerson(
          title: '新的朋友',
          icon: Container(
            width: _iconWidth,
            height: _iconWidth,
            decoration: BoxDecoration(
              color: Color(0xfffa9e3b),
              borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            ),
            child: Icon(Icons.person_add_alt_1, color: Colors.white,),
          )
      ),
      ContactPerson(
          title: '群聊',
          icon: Container(
            width: _iconWidth,
            height: _iconWidth,
            decoration: BoxDecoration(
              color: Color(0xff07c160),
              borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            ),
            child: Icon(Icons.group, color: Colors.white,),
          )
      ),
      ContactPerson(
          title: '标签',
          icon: Container(
            width: _iconWidth,
            height: _iconWidth,
            decoration: BoxDecoration(
              color: Color(0xff2781d7),
              borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            ),
            child: Icon(Icons.local_offer, color: Colors.white,),
          )
      ),
      ContactPerson(
        title: '公众号',
          icon: Container(
            width: _iconWidth,
            height: _iconWidth,
            decoration: BoxDecoration(
              color: Color(0xff2781d7),
              borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            ),
          child: Icon(Icons.person, color: Colors.white,),
        ),
        isShowBottomBorder: false,
      ),
    ];
  }
}
