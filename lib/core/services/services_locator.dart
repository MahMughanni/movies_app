import 'package:get_it/get_it.dart';
import 'package:movies_app/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app/data/repository/movies_repository.dart';
import 'package:movies_app/domain/repository/base_movies_repository.dart';
import 'package:movies_app/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/domain/usecase/get_toprated_movies_usecase.dart';
import 'package:movies_app/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc New Obj
    getIt.registerFactory(
      () => MoviesBloc(
        getIt(),
        getIt(),
        getIt(),
      ),
    );

    /// Data Source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    /// Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository((getIt())));

    /// Use Case
    getIt.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(getIt()));

    getIt.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(getIt()));

    getIt.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(getIt()));
  }
}
