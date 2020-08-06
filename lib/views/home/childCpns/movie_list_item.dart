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
          Text("1"),
          SizedBox(height: 12),//设置元素间（width水平方向，height垂直方向）间距
          Text("2"),
          SizedBox(height: 12),
          Text("3"),
        ],
      ),
    );
  }
}
