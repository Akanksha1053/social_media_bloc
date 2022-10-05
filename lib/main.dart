import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/social_media_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SocialMediaBloc>(
      lazy: false,
      create: (context) => SocialMediaBloc(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
