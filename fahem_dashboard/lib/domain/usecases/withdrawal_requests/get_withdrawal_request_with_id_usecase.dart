import 'package:dartz/dartz.dart';
import 'package:fahem_dashboard/core/error/failure.dart';
import 'package:fahem_dashboard/data/models/withdrawal_request_model.dart';
import 'package:fahem_dashboard/domain/repository/base_repository.dart';
import 'package:fahem_dashboard/domain/usecases/base/base_usecase.dart';

class GetWithdrawalRequestWithIdUseCase extends BaseUseCase<WithdrawalRequestModel, GetWithdrawalRequestWithIdParameters> {
  final BaseRepository _baseRepository;

  GetWithdrawalRequestWithIdUseCase(this._baseRepository);

  @override
  Future<Either<Failure, WithdrawalRequestModel>> call(GetWithdrawalRequestWithIdParameters parameters) async {
    return await _baseRepository.getWithdrawalRequestWithId(parameters);
  }
}

class GetWithdrawalRequestWithIdParameters {
  int withdrawalRequestId;

  GetWithdrawalRequestWithIdParameters({
    required this.withdrawalRequestId,
  });
}