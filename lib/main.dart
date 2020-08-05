import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyStackPage();
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "豆瓣app",
      home: Scaffold(
        appBar: AppBar(
          title: Text("TYC"),
        ),
        body: Text("hello world"),
      ),
    );
  }
}
