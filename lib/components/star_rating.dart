import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {

  final double rating; //当前评分
  final double maxRating; //最高评分
  final Widget unselectedImage; //未选中的图片
  final Widget selectedImage; //选中的图片
  final int count; //星星个数
  final double size; // 星星大小
  final Color unselectedColor; //默认icon时，未选中图标的颜色
  final Color selectedColor;  //默认icon时，选中图片的颜色

  StarRating({
    @required this.rating,
    this.maxRating = 10,
    Widget unselectedImage,
    Widget selectedImage,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xff0000ff),
    this.selectedColor = const Color(0xffff0000)
  }) : unselectedImage = unselectedImage ?? Icon(Icons.star, size: size, color: unselectedColor),
        selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        getUnSelectImage(),
        getSelectedImage()
      ],
    );
  }

 //获取未选中的评星
  Widget getUnSelectImage() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.count, (index) {
          return widget.unselectedImage;
      })
    );

  }

  // 获取选中的Star
  Widget getSelectedImage() {
    //1.计算Star个数
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();

    //2.剩余的一个star显示的比例
    double leftValue = widget.rating - entireCount * oneValue;
    double leftRatio = leftValue / oneValue;

    //2.获取Star
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(entireCount + 1, (int index) {
        if (index < entireCount) {
          return widget.selectedImage;
        }
        return ClipRect(
          clipper: MyRectClipper(width: leftRatio * widget.size),
          child: widget.selectedImage,
        );
      }),
    );
  }
}

class MyRectClipper extends CustomClipper<Rect> {
  final double width;
  MyRectClipper({
    this.width
  });

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    // TODO: implement shouldReclip
    return width != oldClipper.width;
  }
}
