import 'package:get_it/get_it.dart';
import 'package:tv_movice/movies/data/datasource/movie_remote_data_source.dart';
import 'package:tv_movice/movies/data/repository/movies_repository.dart';
import 'package:tv_movice/movies/domain/repositor/base_movie_repositor.dart';
import 'package:tv_movice/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:tv_movice/movies/domain/usecases/get_newpalying_movies_usecase.dart';
import 'package:tv_movice/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tv_movice/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:tv_movice/movies/domain/usecases/get_top_rated_movies_usecases.dart';
import 'package:tv_movice/movies/presentation/controller/movie_details_bloc.dart';
import 'package:tv_movice/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    /// Use Cases
    sl.registerLazySingleton(() => GetNewPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
            () => MoviesRepository(sl()));
    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
            () => MovieRemoteDataSource());

  }
}