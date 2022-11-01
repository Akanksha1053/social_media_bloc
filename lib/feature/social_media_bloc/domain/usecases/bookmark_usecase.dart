import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/post_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/post_repositories.dart';

class BookmarkUseCase implements UseCase<List<PostEntity>, BookmarkParam> {
  final PostRepository bookmarkPostRepository;
  BookmarkUseCase(this.bookmarkPostRepository);

  @override
  Future<Either<Failure, List<PostEntity>>> call(BookmarkParam params) async {
    return Right(
        await bookmarkPostRepository.bookmarkPost(postList: params.postList));
  }
}

class BookmarkParam extends Equatable {
  final List<PostEntity> postList;

  const BookmarkParam({required this.postList});

  @override
  List<Object?> get props => [postList];
}
