import 'package:news_app_assignment6/feature/social_media_bloc/data/model/post_model.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/post_entity.dart';
import 'package:news_app_assignment6/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../domain/repositories/post_repositories.dart';
import '../../domain/usecases/bookmark_usecase.dart';
import '../../domain/usecases/remove_bookmark_usecase.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';
import '../model/stories_model.dart';

class PostRepositoryImpl implements PostRepository {
  final BookMarkLocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  PostRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<PostModel>> bookmarkPost(
      {required List<PostEntity> postList}) async {
    final result = await localDataSource.bookmarkPost(postList: postList);
    return result;
  }

  @override
  Future<List<PostModel>> removeBookmark(
      {required RemoveBookmarkParam postToRemoveFromBookmark}) async {
    final result = await localDataSource.removeBookmark(
        postToRemoveFromBookmark: postToRemoveFromBookmark);
    return result;
  }

  @override
  Future<Either<Failure, List<PostModel>>> getBookmarks() async {
    try {
      final result = await localDataSource.getBookmarkPost();
      return result;
    } on CacheFailure {
      return const Left(CacheFailure('cache failed'));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getAllData() async {
    try {
      final result = await remoteDataSource.getAllData();
      return result;
    } on ServerException {
      return const Left(ServerFailure('server failure occured'));
    }
  }
}
