import 'package:douban_demo/components/star_rating.dart';
import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("小组"),
      ),
      body: Center(
        child: StarRating(
          rating: 9,
          selectedColor: Colors.orange,
          size: 40,
          count: 5,
        )
      ),
    );
  }
}
