import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/presentation/widgets/home_page.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/constants/style_constants.dart';
import '../bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import '../widgets/app_bar_icons.dart';
import 'bookmark_screen.dart';

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
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
        if (state is BottomNavigationLoaded) {
          if (state.navbarItem == NavbarItem.home) {
            return const HomePage();
          } else if (state.navbarItem == NavbarItem.chat) {
            return const HomePage();
          } else if (state.navbarItem == NavbarItem.plus) {
            return const HomePage();
          } else if (state.navbarItem == NavbarItem.profile) {
            return const HomePage();
          } else if (state.navbarItem == NavbarItem.bookmark) {
            return const BookMarkScreen();
          }
          return Container();
        } else {
          BlocProvider.of<BottomNavigationBloc>(context)
              .add(const SelectBottomNavigationEvent(NavbarItem.home, 0));
          return const Center(child: CircularProgressIndicator());
        }
      }),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          if (state is BottomNavigationLoaded) {
            return CurvedNavigationBar(
              index: state.index,
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<BottomNavigationBloc>(context).add(
                      const SelectBottomNavigationEvent(NavbarItem.home, 0));
                } else if (index == 1) {
                  BlocProvider.of<BottomNavigationBloc>(context).add(
                      const SelectBottomNavigationEvent(NavbarItem.chat, 1));
                } else if (index == 2) {
                  BlocProvider.of<BottomNavigationBloc>(context).add(
                      const SelectBottomNavigationEvent(NavbarItem.plus, 1));
                } else if (index == 3) {
                  BlocProvider.of<BottomNavigationBloc>(context).add(
                      const SelectBottomNavigationEvent(NavbarItem.profile, 3));
                } else if (index == 4) {
                  BlocProvider.of<BottomNavigationBloc>(context).add(
                      const SelectBottomNavigationEvent(
                          NavbarItem.bookmark, 4));
                }
              },
              color: bottomNavBarColor,
              buttonBackgroundColor: bottomNavBarButtonBackgroundColor,
              backgroundColor: bottomNavBarBackColor,
              items: const [
                Icon(
                  Icons.home,
                  size: 30,
                  color: bottomNavigationIconColor,
                ),
                Icon(
                  Icons.chat,
                  size: 30,
                  color: bottomNavigationIconColor,
                ),
                Icon(
                  Icons.add,
                  size: 30,
                  color: bottomNavigationIconColor,
                ),
                Icon(
                  Icons.person_rounded,
                  size: 30,
                  color: bottomNavigationIconColor,
                ),
                Icon(
                  Icons.bookmark_add_sharp,
                  size: 30,
                  color: bottomNavigationIconColor,
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
