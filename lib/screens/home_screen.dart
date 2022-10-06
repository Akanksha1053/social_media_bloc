import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/style_constants.dart';
import '../widgets/app_bar_icons.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: appBarBackgroundColor,
            leading: const AppBarIcons(icon: Icons.photo_camera),
            title: const Text('Explore', style: appBarTitleStyle),
            actions: const [AppBarIcons(icon: Icons.notification_add_rounded)]),
        body: Stack(children: const <Widget>[
          HomePage(),
          BottomNavigationWidget(),
        ]));
  }
}
