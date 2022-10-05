import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_assignment6/constants/color_constants.dart';
import 'package:news_app_assignment6/widgets/app_bar_icons.dart';

import '../bloc/social_media_bloc.dart';
import '../widgets/posts.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const AppBarIcons(icon: Icons.arrow_back_ios_new_sharp)),
        backgroundColor: appBarBackgroundColor,
      ),
      body: Container(
        color: scaffoldBackgroundColor,
        child: BlocBuilder<SocialMediaBloc, SocialMediaState>(
            builder: (context, state) {
          if (state is LoadedState) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  Posts(postData: (state).bookmark[index], index: index),
              itemCount: state.bookmark.length,
            );
          }
          return Container();
        }),
      ),
    );
  }
}
