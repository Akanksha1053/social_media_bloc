import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: CircleAvatar(
        backgroundColor: iconBackgroundColor,
        child: Icon(
          icon,
          color: appBarIconColor,
        ),
      ),
    );
  }
}
