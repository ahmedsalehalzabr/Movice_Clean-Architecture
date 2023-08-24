import 'package:dartz/dartz.dart';
import 'package:tv_movice/core/error/failure.dart';
import 'package:tv_movice/movies/domain/entities/movie.dart';
import 'package:tv_movice/movies/domain/entities/movie_detail.dart';
import 'package:tv_movice/movies/domain/entities/recommendation.dart';
import 'package:tv_movice/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:tv_movice/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository {

  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters
      );

}