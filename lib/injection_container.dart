import 'package:get_it/get_it.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/data/datasources/remote_data_source.dart';

import 'package:news_app_assignment6/feature/social_media_bloc/data/repositories/post_repositories_implementation.dart';

import 'package:news_app_assignment6/feature/social_media_bloc/domain/repositories/post_repositories.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/usecases/fetch_data_usecase.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/usecases/get_bookmark_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/social_media_bloc/data/datasources/local_data_source.dart';
import 'feature/social_media_bloc/domain/usecases/bookmark_usecase.dart';
import 'feature/social_media_bloc/domain/usecases/remove_bookmark_usecase.dart';
import 'feature/social_media_bloc/presentation/bloc/bookmark_screen_bloc/bookmark_screen_bloc.dart';
import 'feature/social_media_bloc/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'feature/social_media_bloc/presentation/bloc/fetch_data_bloc/social_media_bloc.dart';
import 'package:http/http.dart' as http;

final sL = GetIt.instance;

void init() {
  //bloc
  sL.registerFactory(
    () => SocialMediaBloc(sL(), sL(), sL(), sL()),
  );
  sL.registerFactory(
    () => BookmarkScreenBloc(sL(), sL()),
  );
  sL.registerFactory(
    () => BottomNavigationBloc(),
  );

//use cases

  sL.registerLazySingleton(() => BookmarkUseCase(sL()));
  sL.registerLazySingleton(() => RemoveBookmarkUseCase(sL()));
  sL.registerLazySingleton(() => FetchAllBookmarksUseCase(sL()));
  sL.registerLazySingleton(() => FetchDataUseCase(sL()));

//repository
  sL.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(sL(), sL()));

//data sources
  sL.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sL()));

  sL.registerLazySingleton<BookMarkLocalDataSource>(
      () => BookMarkLocalDataSourceImpl());

//external
  sL.registerLazySingleton(() => http.Client());
  sL.registerLazySingletonAsync(
      () async => await SharedPreferences.getInstance());
}
