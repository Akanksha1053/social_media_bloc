// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/fetch_data_bloc/social_media_bloc.dart';
// import 'posts.dart';

// class PostsWidget extends StatelessWidget {
//   const PostsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: BlocBuilder<SocialMediaBloc, SocialMediaState>(
//         builder: (context, state) {
//           if (state is LoadedState) {
//             BlocProvider.of<SocialMediaBloc>(context).add(FetchPosts());
//             return ListView.builder(
//               shrinkWrap: true,
//               itemBuilder: (context, index) =>
//                   Posts(postData: (state).posts[index], index: index),
//               itemCount: (state).posts.length,
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
