import 'package:dartz/dartz.dart';
import 'package:fahem/core/error/failure.dart';
import 'package:fahem/data/models/article_model.dart';
import 'package:fahem/domain/repository/base_repository.dart';
import 'package:fahem/domain/usecases/base/base_usecase.dart';

class InsertArticleUseCase extends BaseUseCase<ArticleModel, InsertArticleParameters> {
  final BaseRepository _baseRepository;

  InsertArticleUseCase(this._baseRepository);

  @override
  Future<Either<Failure, ArticleModel>> call(InsertArticleParameters parameters) async {
    return await _baseRepository.insertArticle(parameters);
  }
}

class InsertArticleParameters {
  String image;
  String titleAr;
  String titleEn;
  String articleAr;
  String articleEn;
  int customOrder;
  bool isAvailable;
  String createdAt;

  InsertArticleParameters({
    required this.image,
    required this.titleAr,
    required this.titleEn,
    required this.articleAr,
    required this.articleEn,
    required this.customOrder,
    required this.isAvailable,
    required this.createdAt,
  });
}