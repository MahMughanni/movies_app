import 'package:equatable/equatable.dart';

import '../../domain/entities/movie.dart';
import '../../utils/enums.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMoviesList;
  final List<Movie> popularMoviesList;
  final List<Movie> topRatedMoviesLis;

  final RequestState nowPlayingState;
  final RequestState popularState;
  final RequestState topRatedState;

  final String popularMessage;
  final String nowPlayingMessage;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMoviesList = const [],
    this.popularMoviesList = const [],
    this.topRatedMoviesLis = const [],
    this.nowPlayingState = RequestState.loading,
    this.popularState = RequestState.loading,
    this.topRatedState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMessage = '',
    this.topRatedMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMoviesList,
    List<Movie>? popularMoviesList,
    List<Movie>? topRatedMoviesLis,
    RequestState? nowPlayingState,
    RequestState? popularState,
    RequestState? topRatedState,
    String? nowPlayingMessage,
    String? popularMessage,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMoviesList: nowPlayingMoviesList ?? this.nowPlayingMoviesList,
      popularMoviesList: popularMoviesList ?? this.popularMoviesList,
      topRatedMoviesLis: topRatedMoviesLis ?? this.topRatedMoviesLis,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularState: popularState ?? this.popularState,
      topRatedState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object> get props {
    return [
      nowPlayingMoviesList,
      popularMoviesList,
      topRatedMoviesLis,
      nowPlayingState,
      popularState,
      topRatedState,
      nowPlayingMessage,
      popularMessage,
      topRatedMessage,
    ];
  }
}
