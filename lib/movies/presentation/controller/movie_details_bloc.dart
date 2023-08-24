import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_movice/core/utile/enums.dart';
import 'package:tv_movice/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:tv_movice/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:tv_movice/movies/presentation/controller/movie_details_event.dart';
import 'package:tv_movice/movies/presentation/controller/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailUseCase, this.getRecommendationUseCase,) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEven>(_getRecommendation);
  }
   final GetMovieDetailUseCase getMovieDetailUseCase;
   final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
   final result = await getMovieDetailUseCase(MovieDetailsParameters(
        movieId: event.id
    ));
    result.fold(
            (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
            (r) => emit(state.copyWith(
               movieDetail: r,
               movieDetailsState: RequestState.loaded,
            ),
            ),
    );
  }

  FutureOr<void> _getRecommendation(
      GetMovieRecommendationEven event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(RecommendationParameters(
        event.id,
    ),);
    result.fold(
          (l) => emit(state.copyWith(
        recommendationState: RequestState.error,
        recommendationMessage: l.message,
      )),
          (r) => emit(state.copyWith(
        recommendation: r,
        recommendationState: RequestState.loaded,
      ),
      ),
    );
  }
}