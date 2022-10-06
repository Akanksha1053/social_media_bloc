import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/social_media_bloc.dart';
import '../constants/color_constants.dart';
import '../screens/bookmark_screen.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: BlocBuilder<SocialMediaBloc, SocialMediaState>(
        builder: (context, state) {
          var indx = 0;
          if (state is InitialState) {
            indx = state.selectedIndex;
          }
          if (state is LoadedState) {
            indx = (state).selectedIndex;
          }
          return CurvedNavigationBar(
            index: indx,
            onTap: (value) {
              if (value == 4) {
                (BlocProvider.of<SocialMediaBloc>(context)
                  ..add(FetchBookMark()));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookMarkScreen()),
                );
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
                Icons.comment,
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
        },
      ),
    );
  }
}
