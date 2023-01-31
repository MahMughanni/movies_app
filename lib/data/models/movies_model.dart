import 'package:movies_app/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.id,
      required super.originalTitle,
      required super.overview,
      required super.genreIds,
      required super.posterPath,
      required super.releaseDate,
      required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> fromJson) => MovieModel(
        id: fromJson['id'],
        originalTitle: fromJson['original_title'],
        overview: fromJson['overview'],
        genreIds: List<int>.from(fromJson['genre_ids'].map((e) => e)),
        posterPath: fromJson['poster_path'],
        releaseDate: fromJson['release_date'],
        voteAverage: fromJson['vote_average'].toDouble(),
      );

  @override
  String toString() {
    return 'MovieModel{$id , $originalTitle , $overview , $genreIds , $posterPath , $releaseDate , $voteAverage}';
  }
}
