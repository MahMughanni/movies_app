part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  /// Details
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String moveDetailsMessage;

  ///  Recommendations
  final List<Recommendation> recommendationList;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MovieDetailsState({this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.moveDetailsMessage = '',
      this.recommendationList = const [],
      this.recommendationState = RequestState.loading,
      this.recommendationMessage = ' '});

  MovieDetailsState copyWith({
    final MovieDetails? movieDetailsList,
    final RequestState? movieDetailsState,
    final String? moveDetailsMessage,
    final List<Recommendation>? recommendationList,
    final RequestState? recommendationState,
    final String? recommendationMessage,
  }) {
    return MovieDetailsState(
        movieDetails: movieDetailsList ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        moveDetailsMessage: moveDetailsMessage ?? this.moveDetailsMessage,
        recommendationList: recommendationList ?? this.recommendationList,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage);
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        moveDetailsMessage,
        recommendationList,
        recommendationState,
        recommendationMessage,
      ];
}
