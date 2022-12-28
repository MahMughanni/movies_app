import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repository/base_movies_repository.dart';

import '../../core/error/failure.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final response = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(response);

    } on ServerExceptions catch (error) {
      return Left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final response = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(response);
    } on ServerExceptions catch (error) {
      return Left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final response = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(response);
    } on ServerExceptions catch (error) {
      return Left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }
}
