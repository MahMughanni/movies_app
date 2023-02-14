import 'package:equatable/equatable.dart';

import 'geners.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final List<Genres> genres;



  const MovieDetails(
      { required this.backdropPath,
      required this.id,
      required this.overview,
      required this.releaseDate,
      required this.runtime,
      required this.title,
      required this.voteAverage,
       required this.genres});

  @override
  List<Object?> get props {
    return [
      backdropPath,
      id,
      overview,
      releaseDate,
      runtime,
      title,
      voteAverage,
    ];
  }
}

