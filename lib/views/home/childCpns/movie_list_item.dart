import 'package:douban_demo/components/dashed_line.dart';
import 'package:douban_demo/components/star_rating.dart';
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
          getOriginWidget(),
        ],
      ),
    );
  }
  //1.获取电影排名的Widget
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

  //2.获取中间的内容显示
  Widget getMovieContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getMovieImage(),
        Expanded(
            child: Text("内容显示")
        ),
        Text("分割线"),
        getWishWidget(),
      ],
    );
  }

  //2.1 获取显示的图片
  Widget getMovieImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
        child: Image.network(item.imageURL, height: 150)
    );
  }

  //2.2 获取描述的Widget
  Widget getDetailDescWidget() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            getMovieNameWidget(),
            getRattingWidget(),
            getIntroductionWidget()
          ],
        ),
      ),
    );
  }

  //2.2.1 获取电影名称的展示
  Widget getMovieNameWidget() {
    return Stack(
      children: <Widget>[
        Icon(Icons.play_circle_outline, color: Colors.red, size: 24),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "      " + item.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextSpan(text: "(${item.playDate})", style: TextStyle(fontSize: 18, color: Colors.black54))
            ]
          )
        )
      ],
    );
  }

  //2.2.2 获取电影评分的Widget
  Widget getRattingWidget() {
    return Row(
      children: <Widget>[
        StarRating(
          rating: item.rating,
          size: 20,
          selectedColor: Colors.orange,
        ),
        Text("${item.rating}")
      ],
    );
  }

  //2.2.3 获取电影的简介Widget
  Widget getIntroductionWidget() {
    //拼接所有的 内容
    final genereString = item.genres.join(" ");
    final director = item.director.name;
    final actorString = item.casts.join(" ");
    return Text(
      "$genereString / $director / $actorString",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16)
    );
  }

  //2.3 获取分割线的Widget
  Widget getDashedWidget() {
    return Container(
      width: 1,
      height: 80,
      child: DashedLine(
        axis: Axis.vertical,
        dashedHeight: 5,
        count: 12,
        color: Color(0xffaaaaaa),
      ),
    );
  }
  
  //2.4 获取想看的Widget
  Widget getWishWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/home/wish.png", width: 32),
          SizedBox(height: 5),
          Text("想看", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 235, 170, 60)))
        ],
      ),
    );
  }

  //3.获取原始电影名称的Widget
  Widget getOriginWidget() {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text(
        item.originalTitle,
        style: TextStyle(fontSize: 18, color: Colors.black54),
      ),
    );
  }
}
