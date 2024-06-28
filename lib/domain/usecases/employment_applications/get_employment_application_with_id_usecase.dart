import 'package:dartz/dartz.dart';
import 'package:fahem/core/error/failure.dart';
import 'package:fahem/data/models/employment_application_model.dart';
import 'package:fahem/domain/repository/base_repository.dart';
import 'package:fahem/domain/usecases/base/base_usecase.dart';

class GetEmploymentApplicationWithIdUseCase extends BaseUseCase<EmploymentApplicationModel, GetEmploymentApplicationWithIdParameters> {
  final BaseRepository _baseRepository;

  GetEmploymentApplicationWithIdUseCase(this._baseRepository);

  @override
  Future<Either<Failure, EmploymentApplicationModel>> call(GetEmploymentApplicationWithIdParameters parameters) async {
    return await _baseRepository.getEmploymentApplicationWithId(parameters);
  }
}

class GetEmploymentApplicationWithIdParameters {
  int employmentApplicationId;

  GetEmploymentApplicationWithIdParameters({
    required this.employmentApplicationId,
  });
}