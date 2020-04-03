import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';

void main() async {
  runApp(MyApp());
  initializeStatusBar();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

/// 設置android狀態欄為透明的沉浸, 以及文字顏色變成黑色
/// 寫在組件渲染之後, 是為了在渲染後進行set賦值, 覆蓋狀態欄
/// 寫在渲染之前, MaterialApp組件會覆蓋掉這個值
void initializeStatusBar() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white12, // Color for Android
          statusBarBrightness:
              Brightness.dark // Dark == white status bar -- for IOS.
          ),
    );
  }
}
