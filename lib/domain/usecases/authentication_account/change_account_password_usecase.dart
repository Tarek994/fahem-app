import 'package:dartz/dartz.dart';
import 'package:fahem/core/error/failure.dart';
import 'package:fahem/data/models/account_model.dart';
import 'package:fahem/domain/repository/base_repository.dart';
import 'package:fahem/domain/usecases/base/base_usecase.dart';

class ChangeAccountPasswordUseCase extends BaseUseCase<AccountModel, ChangeAccountPasswordParameters> {
  final BaseRepository _baseRepository;

  ChangeAccountPasswordUseCase(this._baseRepository);

  @override
  Future<Either<Failure, AccountModel>> call(ChangeAccountPasswordParameters parameters) async {
    return await _baseRepository.changeAccountPassword(parameters);
  }
}

class ChangeAccountPasswordParameters {
  int accountId;
  String oldPassword;
  String newPassword;

  ChangeAccountPasswordParameters({
    required this.accountId,
    required this.oldPassword,
    required this.newPassword,
  });
}