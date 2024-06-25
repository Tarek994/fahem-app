import 'package:dartz/dartz.dart';
import 'package:fahem_dashboard/core/error/failure.dart';
import 'package:fahem_dashboard/domain/repository/base_repository.dart';
import 'package:fahem_dashboard/domain/usecases/base/base_usecase.dart';

class DeleteArticleUseCase extends BaseUseCase<void, DeleteArticleParameters> {
  final BaseRepository _baseRepository;

  DeleteArticleUseCase(this._baseRepository);

  @override
  Future<Either<Failure, void>> call(DeleteArticleParameters parameters) async {
    return await _baseRepository.deleteArticle(parameters);
  }
}

class DeleteArticleParameters {
  int articleId;

  DeleteArticleParameters({
    required this.articleId,
  });
}