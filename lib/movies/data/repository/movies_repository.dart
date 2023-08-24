import 'package:dartz/dartz.dart';
import 'package:tv_movice/core/error/exception.dart';
import 'package:tv_movice/core/error/failure.dart';
import 'package:tv_movice/movies/data/datasource/movie_remote_data_source.dart';
import 'package:tv_movice/movies/domain/entities/movie.dart';
import 'package:tv_movice/movies/domain/entities/movie_detail.dart';
import 'package:tv_movice/movies/domain/entities/recommendation.dart';
import 'package:tv_movice/movies/domain/repositor/base_movie_repositor.dart';
import 'package:tv_movice/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:tv_movice/movies/domain/usecases/get_recommendation_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;


  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
     final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
     try{
       return Right(result);
     } on ServerException catch (failure) {
       return Left(ServerFailure(failure.errorMessageModel.statusMessage));
     }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovie();
    try{
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovie();
    try{
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}