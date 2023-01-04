import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/entities/movie_details.dart';
import 'package:movies_app/utils/enums.dart';

import '../../domain/entities/recommendation.dart';
import '../../domain/usecase/get_movies_details_usecase.dart';
import '../../domain/usecase/get_recommendations_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMoviesDetailsUseCase moviesDetailsUseCase;
  GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(
    this.moviesDetailsUseCase,
    this.getRecommendationUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final response =
        await moviesDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    response.fold(
        (l) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            moveDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
              movieDetailsList: r,
              movieDetailsState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final response = await getRecommendationUseCase(
      RecommendationsParameters(event.id),
    );
    response.fold(
      (l) => emit(
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendationList: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }
}
