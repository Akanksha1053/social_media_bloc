import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_assignment6/model/post_data.dart';

import '../bloc/social_media_bloc.dart';
import '../constants/color_constants.dart';

class PostIcons extends StatefulWidget {
  const PostIcons({
    Key? key,
    required this.icon,
    required this.postData,
  }) : super(key: key);
  final IconData icon;
  final PostData postData;

  @override
  State<PostIcons> createState() => _PostIconsState();
}

class _PostIconsState extends State<PostIcons> {
  @override
  Widget build(BuildContext context) {
    PostData post;
    return BlocBuilder<SocialMediaBloc, SocialMediaState>(
      builder: (context, state) {
        bool isBookmarked =
            (state as LoadedState).bookmark.contains(widget.postData);
        return Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            child: Icon(widget.icon,
                color: (isBookmarked && widget.icon == Icons.bookmark_added)
                    ? activeBookmarkColor
                    : postButtonColor));
      },
    );
  }
}
