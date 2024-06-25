import 'package:dartz/dartz.dart';
import 'package:fahem_dashboard/core/error/failure.dart';
import 'package:fahem_dashboard/core/utilities/enums.dart';
import 'package:fahem_dashboard/data/response/admin_notifications_response.dart';
import 'package:fahem_dashboard/domain/repository/base_repository.dart';
import 'package:fahem_dashboard/domain/usecases/base/base_usecase.dart';

class GetAdminNotificationsUseCase extends BaseUseCase<AdminNotificationsResponse, GetAdminNotificationsParameters> {
  final BaseRepository _baseRepository;

  GetAdminNotificationsUseCase(this._baseRepository);

  @override
  Future<Either<Failure, AdminNotificationsResponse>> call(GetAdminNotificationsParameters parameters) async {
    return await _baseRepository.getAdminNotifications(parameters);
  }
}

class GetAdminNotificationsParameters {
  bool? isPaginated;
  int? limit;
  int? page;
  String? searchText;
  OrderByType? orderBy;
  String? filtersMap;

  GetAdminNotificationsParameters({
    this.isPaginated,
    this.limit,
    this.page,
    this.searchText,
    this.orderBy,
    this.filtersMap,
  });
}