// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/fetch_data_bloc/social_media_bloc.dart';
// import 'stories.dart';

// class StoriesWidget extends StatelessWidget {
//   const StoriesWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: MediaQuery.of(context).size.height / 6,
//         child: BlocBuilder<SocialMediaBloc, SocialMediaState>(
//             builder: (context, state) {
//           if (state is InitialState) {
//             BlocProvider.of<SocialMediaBloc>(context).add(FetchStories());
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (state is LoadedState) {
//             return ListView.builder(
//                 itemBuilder: (context, index) {
//                   return Stories(
//                     name: (state).stories[index].firstName,
//                     imageUrl: state.stories[index].picture,
//                   );
//                 },
//                 itemCount: state.stories.length,
//                 scrollDirection: Axis.horizontal);
//           }
//           return Container();
//         }));
//   }
// }
