import 'package:dartz/dartz.dart';
import 'package:fahem_business/core/error/failure.dart';
import 'package:fahem_business/data/models/complaint_model.dart';
import 'package:fahem_business/domain/repository/base_repository.dart';
import 'package:fahem_business/domain/usecases/base/base_usecase.dart';

class InsertComplaintUseCase extends BaseUseCase<ComplaintModel, InsertComplaintParameters> {
  final BaseRepository _baseRepository;

  InsertComplaintUseCase(this._baseRepository);

  @override
  Future<Either<Failure, ComplaintModel>> call(InsertComplaintParameters parameters) async {
    return await _baseRepository.insertComplaint(parameters);
  }
}

class InsertComplaintParameters {
  int userId;
  String complaint;
  String createdAt;

  InsertComplaintParameters({
    required this.userId,
    required this.complaint,
    required this.createdAt,
  });
}