import 'package:douban_demo/components/dashed_line.dart';
import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("书影音"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          child: DashedLine(
            axis: Axis.vertical,
            dashedWidth: 1,
            dashedHeight: 8,
            count: 10,
            color: Colors.red,
          ),
        )
      ),
    );
  }
}
