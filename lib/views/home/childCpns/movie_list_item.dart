import 'package:douban_demo/models/home_model.dart';
import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final MovieItem item;
  MovieListItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Text(item.title);
  }
}
