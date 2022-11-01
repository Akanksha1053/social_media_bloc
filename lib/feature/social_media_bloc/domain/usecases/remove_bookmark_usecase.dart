import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/post_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/post_repositories.dart';

class RemoveBookmarkUseCase implements UseCase<void, RemoveBookmarkParam> {
  final PostRepository removeBookmarkPostRepository;
  RemoveBookmarkUseCase(this.removeBookmarkPostRepository);

  @override
  Future<Either<Failure, List<PostEntity>>> call(
      RemoveBookmarkParam params) async {
    return Right(await removeBookmarkPostRepository.removeBookmark(
        postToRemoveFromBookmark: RemoveBookmarkParam(
            postToRemoveFromBookmark: params.postToRemoveFromBookmark)));
  }
}

class RemoveBookmarkParam extends Equatable {
  final PostEntity postToRemoveFromBookmark;

  const RemoveBookmarkParam({required this.postToRemoveFromBookmark});

  @override
  List<Object?> get props => [postToRemoveFromBookmark];
}
