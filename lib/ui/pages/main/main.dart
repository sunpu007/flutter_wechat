import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/pages/address_book/address_book.dart';
import 'package:flutter_wechat/ui/pages/discovery/discovery.dart';
import 'package:flutter_wechat/ui/pages/message/message.dart';
import 'package:flutter_wechat/ui/pages/mine/mine.dart';

class MainPage extends StatefulWidget {
  static const String routerName = '/';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

final List<Widget> pageList = [
  MessagePage(),
  AddressBook(),
  DiscoveryPage(),
  MinePage()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(Icons.chat_bubble_outline),
    activeIcon: Icon(Icons.chat_bubble),
    label: '微信',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.group_outlined),
    activeIcon: Icon(Icons.group),
    label: '通讯录',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.explore_outlined),
    activeIcon: Icon(Icons.explore),
    label: '发现',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline),
    activeIcon: Icon(Icons.person),
    label: '我',
  ),
];
