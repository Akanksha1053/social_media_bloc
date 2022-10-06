import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_assignment6/constants/color_constants.dart';
import 'package:news_app_assignment6/model/post_data.dart';

import '../bloc/social_media_bloc.dart';
import '../constants/style_constants.dart';
import 'post_icons.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key, required this.postData, required this.index})
      : super(key: key);
  final PostData postData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: postContainerColor),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(postData.owner!.picture),
                  ),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      "${postData.owner!.firstName} ${postData.owner!.lastName}",
                      style: postNameTextStyle,
                    ),
                  ))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 1.1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    (postData).image.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.81,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: postBottomButtonDecoration,
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 21,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PostIcons(
                        icon: Icons.comment_rounded,
                        postData: postData,
                      ),
                      const Text(
                        '10',
                        style: postButtonStyle,
                      ),
                      PostIcons(
                        icon: Icons.favorite_rounded,
                        postData: postData,
                      ),
                      Text(
                        postData.likes.toString(),
                        style: postButtonStyle,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PostIcons(
                        icon: Icons.share,
                        postData: postData,
                      ),
                      IconButton(
                        icon: PostIcons(
                            icon: Icons.bookmark_added, postData: postData),
                        onPressed: () {
                          BlocProvider.of<SocialMediaBloc>(context)
                              .add(BookMark(postData, index));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
