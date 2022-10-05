import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_assignment6/bloc/social_media_bloc.dart';
import 'package:news_app_assignment6/screens/bookmark_screen.dart';

import '../constants/color_constants.dart';
import '../constants/style_constants.dart';
import '../widgets/app_bar_icons.dart';
import '../widgets/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: HomePage(),
        bottomNavigationBar: CurvedNavigationBar(
          index: 2,
          onTap: (value) {
            if (value == 4) {
              (BlocProvider.of<SocialMediaBloc>(context)..add(FetchBookMark()));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookMarkScreen()),
              );
            }
          },
          color: bottomNavBarColor,
          buttonBackgroundColor: bottomNavBarButtonBackgroundColor,
          backgroundColor: bottomNavBarBackColor,
          items: const [
            Icon(
              Icons.home,
              size: 20,
              color: bottomNavigationIconColor,
            ),
            Icon(
              Icons.comment,
              size: 25,
              color: bottomNavigationIconColor,
            ),
            Icon(
              Icons.add,
              size: 25,
              color: bottomNavigationIconColor,
            ),
            Icon(
              Icons.person_rounded,
              size: 25,
              color: bottomNavigationIconColor,
            ),
            Icon(
              Icons.bookmark_add_sharp,
              size: 25,
              color: bottomNavigationIconColor,
            ),
          ],
        ));
  }
}
