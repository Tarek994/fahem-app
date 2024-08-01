import 'package:dartz/dartz.dart';
import 'package:fahem_business/core/error/failure.dart';
import 'package:fahem_business/core/utilities/enums.dart';
import 'package:fahem_business/data/response/instant_consultations_response.dart';
import 'package:fahem_business/domain/repository/base_repository.dart';
import 'package:fahem_business/domain/usecases/base/base_usecase.dart';

class GetInstantConsultationsUseCase extends BaseUseCase<InstantConsultationsResponse, GetInstantConsultationsParameters> {
  final BaseRepository _baseRepository;

  GetInstantConsultationsUseCase(this._baseRepository);

  @override
  Future<Either<Failure, InstantConsultationsResponse>> call(GetInstantConsultationsParameters parameters) async {
    return await _baseRepository.getInstantConsultations(parameters);
  }
}

class GetInstantConsultationsParameters {
  bool? isPaginated;
  int? limit;
  int? page;
  String? searchText;
  OrderByType? orderBy;
  String? filtersMap;

  GetInstantConsultationsParameters({
    this.isPaginated,
    this.limit,
    this.page,
    this.searchText,
    this.orderBy,
    this.filtersMap,
  });
}