import 'package:flutter/material.dart';

class TabbarItem extends BottomNavigationBarItem {
  TabbarItem(String iconName, String title) : super(
      icon: Image.asset("assets/images/tabbaricon/${iconName}_normal.png", width: 30),
      activeIcon: Image.asset("assets/images/tabbaricon/${iconName}_click.png", width: 30),
      title: Text(title)
  );
}
