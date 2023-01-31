import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/domain/entities/movie_details.dart';
import 'package:movies_app/domain/repository/base_movies_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {

  BaseMoviesRepository baseMoviesRepository;
  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }

}






class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
