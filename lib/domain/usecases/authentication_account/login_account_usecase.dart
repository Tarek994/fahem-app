import 'package:dartz/dartz.dart';
import 'package:fahem/core/error/failure.dart';
import 'package:fahem/data/models/account_model.dart';
import 'package:fahem/domain/repository/base_repository.dart';
import 'package:fahem/domain/usecases/base/base_usecase.dart';

class LoginAccountUseCase extends BaseUseCase<AccountModel, LoginAccountParameters> {
  final BaseRepository _baseRepository;

  LoginAccountUseCase(this._baseRepository);

  @override
  Future<Either<Failure, AccountModel>> call(LoginAccountParameters parameters) async {
    return await _baseRepository.loginAccount(parameters);
  }
}

class LoginAccountParameters {
  String emailAddress;
  String password;

  LoginAccountParameters({
    required this.emailAddress,
    required this.password,
  });
}