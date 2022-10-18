import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/presentation/bloc/bookmark_screen_bloc/bookmark_screen_bloc.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/presentation/bloc/fetch_data_bloc/social_media_bloc.dart';
import 'feature/social_media_bloc/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'feature/social_media_bloc/presentation/screens/home_screen.dart';
import 'injection_container.dart' as dependency_injection;
import 'injection_container.dart';

void main() {
  dependency_injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SocialMediaBloc>(
          lazy: false,
          create: (context) => sL<SocialMediaBloc>(),
        ),
        BlocProvider<BottomNavigationBloc>(
          create: (context) => sL<BottomNavigationBloc>(),
        ),
        BlocProvider<BookmarkScreenBloc>(
          create: (context) => sL<BookmarkScreenBloc>(),
        ),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
