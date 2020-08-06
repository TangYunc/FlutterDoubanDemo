import 'package:douban_demo/networking/http_request.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: HomeBody()
    );
  }
}


class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpRequest.request("https://douban.uieee.com/v2/movie/top250?start=0&count=20").then((res) {
      print(res);
      print(res.runtimeType);
      final subjects = res.data["subjects"];
      print(subjects);
      print(subjects.runtimeType);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("首页", style: TextStyle(fontSize: 30, color: Colors.red)),
    );
  }
}
