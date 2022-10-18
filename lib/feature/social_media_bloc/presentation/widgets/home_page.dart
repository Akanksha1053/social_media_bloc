import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/fetch_data_bloc/social_media_bloc.dart';
import 'posts.dart';
import 'posts_widget.dart';
import 'stories.dart';
import 'stories_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialMediaBloc, SocialMediaState>(
        builder: (context, state) {
      if (state is InitialState) {
        BlocProvider.of<SocialMediaBloc>(context).add(FetchData());
        return const Center(child: CircularProgressIndicator());
      }
      if (state is LoadedState) {
        return Column(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Stories(
                      name: (state).posts[index].owner!.firstName,
                      imageUrl: state.posts[index].owner!.picture,
                    );
                  },
                  itemCount: state.posts.length,
                  scrollDirection: Axis.horizontal)),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  Posts(postData: (state).posts[index], index: index),
              itemCount: (state).posts.length,
            ),
          )
        ]);
      }
      return Container();
    });
  }
}
