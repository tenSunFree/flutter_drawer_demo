import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  /// BottomNavigationBar  icon list
  List<Widget> _bottomBarIconList = [
    Icon(Icons.room),
    Icon(Icons.weekend),
    Icon(Icons.message),
    Icon(Icons.face),
  ];

  /// BottomNavigationBar  text list
  List<String> _bottomBarTextList = [
    "門市據點",
    "線上訂位",
    "最新消息",
    "會員專區",
  ];

  /// BottomNavigationBar currently selected items
  int _bottomNavigationSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF292929),
        title: Text(
            "${_bottomBarTextList.elementAt(_bottomNavigationSelectedIndex)}"),
      ),
      drawer: _getDrawer(),
      body: Center(
        child:
            _getBottomBarWidgetList().elementAt(_bottomNavigationSelectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFC5160F),
        selectedItemColor: Color(0xFFFFFFFF),
        // display more than 3 items
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 5.0,
        currentIndex: _bottomNavigationSelectedIndex,
        items: _getBottomBarItemList(),
        onTap: _getBottomBarTap,
      ),
    );
  }

  Drawer _getDrawer() {
    return Drawer(
      child: Container(
        alignment: Alignment.bottomLeft,
        color: Color(0xFFC5160F),
        child: Image.asset(
          "assets/icon_drawer.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  /// 獲取底部導航項集合
  List<BottomNavigationBarItem> _getBottomBarItemList() {
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < _getBottomBarWidgetList().length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: _bottomBarIconList.elementAt(i),
          title: Text("${_bottomBarTextList.elementAt(i)}"),
        ),
      );
    }
    return items;
  }

  /// BottomNavigationBar widget list
  List<Widget> _getBottomBarWidgetList() {
    List<String> nameList = [
      'assets/icon_store.png',
      "assets/icon_booking_member.png",
      "assets/icon_new.png",
      "assets/icon_booking_member.png",
    ];
    List<Widget> _bottomBarWidgetList = List();
    for (String name in nameList) {
      _bottomBarWidgetList.add(Image.asset(
        name,
        width: double.infinity,
        fit: BoxFit.fill,
      ));
    }
    return _bottomBarWidgetList;
  }

  /// 底部導航的點擊事件處理
  _getBottomBarTap(int index) {
    setState(() {
      _bottomNavigationSelectedIndex = index;
    });
  }
}
