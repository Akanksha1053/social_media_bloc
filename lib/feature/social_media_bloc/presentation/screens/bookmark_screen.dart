import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/style_constants.dart';
import '../bloc/bookmark_screen_bloc/bookmark_screen_bloc.dart';
import '../widgets/post_icons.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookmarkScreenBloc>(context).add(const FetchBookMarkList());
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarBackgroundColor,
      ),
      body: Container(
        color: scaffoldBackgroundColor,
        child: BlocBuilder<BookmarkScreenBloc, BookmarkScreenState>(
            builder: (context, state) {
          if (state is LoadedState) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.bookmark.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: postContainerColor),
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
                                  backgroundImage: NetworkImage(
                                      state.bookmark[index].owner!.picture),
                                ),
                                Expanded(
                                    child: ListTile(
                                  title: Text(
                                    "${state.bookmark[index].owner!.firstName} ${state.bookmark[index].owner!.lastName}",
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
                                  state.bookmark[index].image.toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 2.7,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: postBottomButtonDecoration,
                            width: MediaQuery.of(context).size.width / 1.13,
                            height: MediaQuery.of(context).size.height / 18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PostIcons(
                                      icon: Icons.comment_rounded,
                                      postData: state.bookmark[index],
                                    ),
                                    const Text(
                                      '10',
                                      style: postButtonStyle,
                                    ),
                                    PostIcons(
                                      icon: Icons.favorite_rounded,
                                      postData: state.bookmark[index],
                                    ),
                                    Text(
                                      state.bookmark[index].likes.toString(),
                                      style: postButtonStyle,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    PostIcons(
                                      icon: Icons.share,
                                      postData: state.bookmark[index],
                                    ),
                                    IconButton(
                                      icon: PostIcons(
                                          icon: Icons.bookmark_added,
                                          postData: state.bookmark[index]),
                                      onPressed: () {
                                        BlocProvider.of<BookmarkScreenBloc>(
                                                context)
                                            .add(RemoveFromBookmarkEvent(
                                                state.bookmark[index]));
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
                });
          } else {
            BlocProvider.of<BookmarkScreenBloc>(context)
                .add(const FetchBookMarkList());
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
