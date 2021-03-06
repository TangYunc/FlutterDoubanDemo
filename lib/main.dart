import 'package:douban_demo/components/tabbar_item.dart';
import 'package:douban_demo/views/group/group.dart';
import 'package:douban_demo/views/home/home.dart';
import 'package:douban_demo/views/mall/mall.dart';
import 'package:douban_demo/views/profile/profile.dart';
import 'package:douban_demo/views/subject/subject.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "豆瓣app",
      theme: ThemeData(
          primaryColor: Colors.green,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent
      ),
      home: MyStackPage(),
    );
  }
}

class MyStackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStackPageState();
  }
}

class MyStackPageState extends State<MyStackPage> {

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: [
          TabbarItem("home", "首页"),
          TabbarItem("patient", "书影音"),
          TabbarItem("education", "小组"),
          TabbarItem("miaoAcademy", "市集"),
          TabbarItem("mine", "我的"),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Home(),
          Subject(),
          Group(),
          Mall(),
          Profile()
        ],
      ),
    );
  }
}
