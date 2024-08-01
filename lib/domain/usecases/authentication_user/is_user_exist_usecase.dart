import 'package:dartz/dartz.dart';
import 'package:fahem_business/core/error/failure.dart';
import 'package:fahem_business/domain/repository/base_repository.dart';
import 'package:fahem_business/domain/usecases/base/base_usecase.dart';

class IsUserExistUseCase extends BaseUseCase<bool, IsUserExistParameters> {
  final BaseRepository _baseRepository;

  IsUserExistUseCase(this._baseRepository);

  @override
  Future<Either<Failure, bool>> call(IsUserExistParameters parameters) async {
    return await _baseRepository.isUserExist(parameters);
  }
}

class IsUserExistParameters {
  int userId;

  IsUserExistParameters({
    required this.userId,
  });
}