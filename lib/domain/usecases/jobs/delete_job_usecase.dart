import 'package:dartz/dartz.dart';
import 'package:fahem/core/error/failure.dart';
import 'package:fahem/domain/repository/base_repository.dart';
import 'package:fahem/domain/usecases/base/base_usecase.dart';

class DeleteJobUseCase extends BaseUseCase<void, DeleteJobParameters> {
  final BaseRepository _baseRepository;

  DeleteJobUseCase(this._baseRepository);

  @override
  Future<Either<Failure, void>> call(DeleteJobParameters parameters) async {
    return await _baseRepository.deleteJob(parameters);
  }
}

class DeleteJobParameters {
  int jobId;

  DeleteJobParameters({
    required this.jobId,
  });
}