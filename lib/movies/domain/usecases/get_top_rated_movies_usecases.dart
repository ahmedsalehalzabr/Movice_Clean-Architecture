
import 'package:dartz/dartz.dart';
import 'package:tv_movice/core/error/failure.dart';
import 'package:tv_movice/core/usecase/base_usescase.dart';
import 'package:tv_movice/movies/domain/entities/movie.dart';
import 'package:tv_movice/movies/domain/repositor/base_movie_repositor.dart';

class GetTopRatedMoviesUseCase extends BaseUsesCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }

}