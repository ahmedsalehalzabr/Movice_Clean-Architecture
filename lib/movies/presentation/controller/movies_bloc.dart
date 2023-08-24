import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_movice/core/usecase/base_usescase.dart';
import 'package:tv_movice/core/utile/enums.dart';
import 'package:tv_movice/movies/domain/usecases/get_newpalying_movies_usecase.dart';
import 'package:tv_movice/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tv_movice/movies/domain/usecases/get_top_rated_movies_usecases.dart';
import 'package:tv_movice/movies/presentation/controller/movies_event.dart';
import 'package:tv_movice/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNewPlayingMoviesUseCase getNewPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
      this.getNewPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase,
      ) : super(const MoviesState()) {
    on<GetNewPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }


  FutureOr<void> _getNowPlayingMovies(GetNewPlayingMoviesEvent event, Emitter<MoviesState> emit) async {

    final result = await getNewPlayingMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(
          state.CopyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          )
      ),
          (r) => emit(
        state.CopyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {

    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(
          state.CopyWith(
            popularState: RequestState.error,
            popularMessage: l.message,
          )
      ),
          (r) => emit(
        state.CopyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {

    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(
          state.CopyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message,
          )
      ),
          (r) => emit(
        state.CopyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}