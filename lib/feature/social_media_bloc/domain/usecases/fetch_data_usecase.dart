import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repositories.dart';

class FetchDataUseCase
    implements UseCase<List<PostEntity>, FetchDataListNoParams> {
  final PostRepository getAllDataRepository;
  FetchDataUseCase(this.getAllDataRepository);
  @override
  Future<Either<Failure, List<PostEntity>>> call(
      FetchDataListNoParams noParams) async {
    return await getAllDataRepository.getAllData();
  }
}

class FetchDataListNoParams {}
