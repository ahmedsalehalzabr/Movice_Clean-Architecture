import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_movice/core/error/failure.dart';
import 'package:tv_movice/core/usecase/base_usescase.dart';
import 'package:tv_movice/movies/domain/entities/recommendation.dart';
import 'package:tv_movice/movies/domain/repositor/base_movie_repositor.dart';

class GetRecommendationUseCase extends BaseUsesCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
   return await baseMoviesRepository.getRecommendation(parameters);
  }
}
class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];
}