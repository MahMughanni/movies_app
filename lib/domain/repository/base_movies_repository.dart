import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/movie_details.dart';
import 'package:movies_app/domain/entities/recommendation.dart';
import 'package:movies_app/domain/usecase/get_movies_details_usecase.dart';

import '../../core/error/failure.dart';
import '../usecase/get_recommendations_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationsParameters parameters);
}
