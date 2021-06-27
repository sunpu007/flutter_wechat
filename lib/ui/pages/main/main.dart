import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/pages/address_book/address_book.dart';
import 'package:flutter_wechat/ui/pages/discovery/discovery.dart';
import 'package:flutter_wechat/ui/pages/mine/mine.dart';

class MainPage extends StatefulWidget {
  static const String routerName = '/';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
  AddressBook(),
  DiscoveryPage(),
  MinePage()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(Icons.people),
    label: '通讯录',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.compass),
    activeIcon: Icon(Icons.compass_fill),
    label: '发现',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: '我',
  ),
];
