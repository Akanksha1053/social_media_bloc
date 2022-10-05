import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/social_media_bloc.dart';
import '../constants/color_constants.dart';
import 'posts_widget.dart';
import 'stories_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StoriesWidget(),
      PostsWidget(),
    ]);
  }
}
