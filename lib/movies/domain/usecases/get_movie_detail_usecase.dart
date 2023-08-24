import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_movice/core/error/failure.dart';
import 'package:tv_movice/core/usecase/base_usescase.dart';
import 'package:tv_movice/movies/domain/entities/movie_detail.dart';
import 'package:tv_movice/movies/domain/repositor/base_movie_repositor.dart';

class GetMovieDetailUseCase extends BaseUsesCase<MovieDetail , MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
  return await baseMoviesRepository.getMovieDetails(parameters);
  }
}
class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}