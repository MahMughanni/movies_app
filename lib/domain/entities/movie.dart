class Movie {
  final int id;
  final String originalTitle;
  final String overview;
  final List<int> genreIds;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  Movie({
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.genreIds,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          originalTitle == other.originalTitle &&
          overview == other.overview &&
          genreIds == other.genreIds &&
          posterPath == other.posterPath &&
          releaseDate == other.releaseDate &&
          voteAverage == other.voteAverage;

  @override
  int get hashCode =>
      id.hashCode ^
      originalTitle.hashCode ^
      overview.hashCode ^
      genreIds.hashCode ^
      posterPath.hashCode ^
      releaseDate.hashCode ^
      voteAverage.hashCode;
}
