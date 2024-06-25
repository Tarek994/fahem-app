import 'package:dartz/dartz.dart';
import 'package:fahem_business/core/error/failure.dart';
import 'package:fahem_business/data/models/admin_notification_model.dart';
import 'package:fahem_business/domain/repository/base_repository.dart';
import 'package:fahem_business/domain/usecases/base/base_usecase.dart';

class GetAdminNotificationWithIdUseCase extends BaseUseCase<AdminNotificationModel, GetAdminNotificationWithIdParameters> {
  final BaseRepository _baseRepository;

  GetAdminNotificationWithIdUseCase(this._baseRepository);

  @override
  Future<Either<Failure, AdminNotificationModel>> call(GetAdminNotificationWithIdParameters parameters) async {
    return await _baseRepository.getAdminNotificationWithId(parameters);
  }
}

class GetAdminNotificationWithIdParameters {
  int adminNotificationId;

  GetAdminNotificationWithIdParameters({
    required this.adminNotificationId,
  });
}