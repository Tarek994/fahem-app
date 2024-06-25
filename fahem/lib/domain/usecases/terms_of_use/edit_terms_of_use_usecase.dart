import 'package:dartz/dartz.dart';
import 'package:fahem/core/error/failure.dart';
import 'package:fahem/data/models/terms_of_use_model.dart';
import 'package:fahem/domain/repository/base_repository.dart';
import 'package:fahem/domain/usecases/base/base_usecase.dart';

class EditTermsOfUseUseCase extends BaseUseCase<TermsOfUseModel, EditTermsOfUseParameters> {
  final BaseRepository _baseRepository;

  EditTermsOfUseUseCase(this._baseRepository);

  @override
  Future<Either<Failure, TermsOfUseModel>> call(EditTermsOfUseParameters parameters) async {
    return await _baseRepository.editTermsOfUse(parameters);
  }
}

class EditTermsOfUseParameters {
  String textAr;
  String textEn;

  EditTermsOfUseParameters({
    required this.textAr,
    required this.textEn,
  });
}