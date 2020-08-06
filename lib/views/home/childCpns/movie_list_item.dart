import 'package:douban_demo/models/home_model.dart';
import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final MovieItem item;
  MovieListItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),//设置单元格内元素的上下左右内边距
      decoration: BoxDecoration(//设置单元格边框
        border: Border(
          bottom: BorderSide(width: 10, color: Color(0xffe2e2e2))//设置单元格底部间隔高度
        )
      ),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,//垂直方向从上到下
//        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,//水平（纵横交叉轴）方向，从左到右
        children: <Widget>[
          //1.电影排名
          getRankWidget(),
          SizedBox(height: 12),//设置元素间（width水平方向，height垂直方向）间距
          //2.具体内容
          getRankWidget(),
          SizedBox(height: 12),
          // 3.电影简介
          getRankWidget(),
        ],
      ),
    );
  }

  Widget getRankWidget() {
    return Container(
//      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 9),//距离的方法
      padding: EdgeInsets.fromLTRB(9, 4, 9, 4),//设置内边框距离的方法
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color.fromARGB(255, 238, 205, 144)
      ),
      child: Text(
        "No.${item.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36))
      ),
    );
  }
}
