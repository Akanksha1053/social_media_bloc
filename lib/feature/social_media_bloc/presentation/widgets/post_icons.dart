import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/post_entity.dart';

import '../../../../core/constants/color_constants.dart';
import '../bloc/fetch_data_bloc/social_media_bloc.dart';

class PostIcons extends StatefulWidget {
  const PostIcons({
    Key? key,
    required this.icon,
    required this.postData,
  }) : super(key: key);
  final IconData icon;
  final PostEntity postData;

  @override
  State<PostIcons> createState() => _PostIconsState();
}

class _PostIconsState extends State<PostIcons> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialMediaBloc, SocialMediaState>(
      builder: (context, state) {
        return Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            child: Icon(widget.icon, color: postButtonColor));
      },
    );
  }
}
