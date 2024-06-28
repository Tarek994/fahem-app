import 'package:dartz/dartz.dart';
import 'package:fahem/core/error/failure.dart';
import 'package:fahem/data/models/instant_consultation_model.dart';
import 'package:fahem/domain/repository/base_repository.dart';
import 'package:fahem/domain/usecases/base/base_usecase.dart';

class EditInstantConsultationUseCase extends BaseUseCase<InstantConsultationModel, EditInstantConsultationParameters> {
  final BaseRepository _baseRepository;

  EditInstantConsultationUseCase(this._baseRepository);

  @override
  Future<Either<Failure, InstantConsultationModel>> call(EditInstantConsultationParameters parameters) async {
    return await _baseRepository.editInstantConsultation(parameters);
  }
}

class EditInstantConsultationParameters {
  int instantConsultationId;
  int userId;
  String consultation;
  bool isDone;
  int? bestInstantConsultationCommentId;
  bool isViewed;
  List<String> images;

  EditInstantConsultationParameters({
    required this.instantConsultationId,
    required this.userId,
    required this.consultation,
    required this.isDone,
    required this.bestInstantConsultationCommentId,
    required this.isViewed,
    required this.images,
  });
}