import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repositories.dart';

class FetchAllBookmarksUseCase
    implements UseCase<List<PostEntity>, FetchBookmarkListNoParams> {
  final PostRepository getBookmarkRepository;
  FetchAllBookmarksUseCase(this.getBookmarkRepository);
  @override
  Future<Either<Failure, List<PostEntity>>> call(
      FetchBookmarkListNoParams noParams) async {
    return await getBookmarkRepository.getBookmarks();
  }
}

class FetchBookmarkListNoParams {}
