import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/movie_details.dart';

import '../../domain/entities/geners.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage,
      required super.genres});


  factory MovieDetailsModel.fromJson(Map<String, dynamic> fromJson) {
    return MovieDetailsModel(
      backdropPath:
          fromJson['backdrop_path'] ?? "/fMkfImQS9ZRRQbsKfeORnpyLMNL.jpg",
      id: fromJson['id'],
      overview: fromJson['overview'],
      releaseDate: fromJson['release_date'],
      runtime: fromJson['runtime'],
      title: fromJson['title'],
      voteAverage: fromJson['vote_average'].toDouble(),
      genres: List<GenresModel>.from(
        (fromJson['genres'] as List).map((e) => GenresModel.fromJson(e)),
      ),
    );
  }



}





class GenresModel extends Genres {
  const GenresModel({
    required super.name,
    required super.id,
  });

  factory GenresModel.fromJson(Map<String, dynamic> fromJson) {
    return GenresModel(
      id: fromJson['id'],
      name: fromJson['name'],
    );
  }

  @override
  List<Object> get props => [id, name];
}
