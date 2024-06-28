import 'package:dartz/dartz.dart';
import 'package:fahem/core/error/failure.dart';
import 'package:fahem/core/utilities/enums.dart';
import 'package:fahem/data/models/version_model.dart';
import 'package:fahem/domain/repository/base_repository.dart';
import 'package:fahem/domain/usecases/base/base_usecase.dart';

class GetVersionUseCase extends BaseUseCase<VersionModel, GetVersionParameters> {
  final BaseRepository _baseRepository;

  GetVersionUseCase(this._baseRepository);

  @override
  Future<Either<Failure, VersionModel>> call(GetVersionParameters parameters) async {
    return await _baseRepository.getVersion(parameters);
  }
}

class GetVersionParameters {
  App app;

  GetVersionParameters({
    required this.app,
  });
}