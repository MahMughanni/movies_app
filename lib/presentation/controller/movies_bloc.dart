import 'dart:async';

import 'package:movies_app/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/domain/usecase/get_toprated_movies_usecase.dart';
import 'package:movies_app/presentation/controller/movies_event.dart';
import 'package:movies_app/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/utils/enums.dart';

import '../../core/usecase/base_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final response = await getNowPlayingMoviesUseCase(const NoParameters());

    // print(response) ;
    response.fold((error) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: error.message,
            )),
        (response) => emit(state.copyWith(
              nowPlayingMoviesList: response,
              nowPlayingState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold(
        (error) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: error.message,
            )),
        (response) => emit(state.copyWith(
              popularMoviesList: response,
              popularState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final response = await getTopRatedMoviesUseCase(const NoParameters());

    response.fold(
        (error) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: error.message,
            )), (response) {
      // print(response);
      return emit(state.copyWith(
        topRatedMoviesLis: response,
        topRatedState: RequestState.loaded,
      ));
    });
  }
}
