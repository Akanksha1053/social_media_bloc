import 'package:dartz/dartz.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/post_entity.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/usecases/remove_bookmark_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../entities/story_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getBookmarks();
  Future<List<PostEntity>> bookmarkPost({required List<PostEntity> postList});
  Future<List<PostEntity>> removeBookmark(
      {required RemoveBookmarkParam postToRemoveFromBookmark});
  Future<Either<Failure, List<PostEntity>>> getAllData();
}
