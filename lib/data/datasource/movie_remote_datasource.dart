import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/error_message.dart';
import 'package:movies_app/data/models/movies_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
}



class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMovePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.getPopularMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.getTopRatedMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
