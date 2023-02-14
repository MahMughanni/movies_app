/*
import 'package:movies_app/domain/entities/movie.dart';

import '../data/models/movie_details_model.dart';
import '../domain/entities/geners.dart';
import '../domain/entities/recommendation.dart';

List<Movie> moviesList = [
  Movie(
    posterPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
    genreIds: const [
      14,
      28,
      12,
    ],
    id: 453395,
    overview:
        "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
    releaseDate: "2022-05-04",
    originalTitle: "Movie Title",
    voteAverage: 5.0,
  ),
  Movie(
    posterPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
    genreIds: const [
      14,
      28,
      12,
    ],
    id: 453395,
    overview:
        "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
    releaseDate: "2022-05-04",
    originalTitle: "Movie Title",
    voteAverage: 5.0,
  ),
  Movie(
    posterPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
    genreIds: const [
      14,
      28,
      12,
    ],
    id: 453395,
    overview:
        "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
    releaseDate: "2022-05-04",
    originalTitle: "Movie Title",
    voteAverage: 5.0,
  ),
  Movie(
    posterPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
    genreIds: const [
      14,
      28,
      12,
    ],
    id: 453395,
    overview:
        "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
    releaseDate: "2022-05-04",
    originalTitle: "Movie Title",
    voteAverage: 5.0,
  ),
  Movie(
    posterPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
    genreIds: const [
      14,
      28,
      12,
    ],
    id: 453395,
    overview:
        "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
    releaseDate: "2022-05-04",
    originalTitle: "Movie Title",
    voteAverage: 5.0,
  ),
  Movie(
    posterPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
    genreIds: const [
      14,
      28,
      12,
    ],
    id: 453395,
    overview:
        "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
    releaseDate: "2022-05-04",
    originalTitle: "Movie Title",
    voteAverage: 5.0,
  ),
  Movie(
    posterPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
    genreIds: const [
      14,
      28,
      12,
    ],
    id: 453395,
    overview:
        "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
    releaseDate: "2022-05-04",
    originalTitle: "Movie Title",
    voteAverage: 5.0,
  ),
];

MovieDetailsModel movieDetailDummy = const MovieDetailsModel(
  backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
  genres: [
    Genres(name: 'Family', id: 10751),
  ],
  id: 438148,
  overview:
      "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
  releaseDate: "2022-06-29",
  runtime: 87,
  title: "Minions: The Rise of Gru",
  voteAverage: 7.8,
);

MovieDetailsModel movieDetailsModel = const MovieDetailsModel(
  backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
  id: 438148,
  overview:
      "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
  releaseDate: "2022-06-29",
  runtime: 87,
  title: "Minions: The Rise of Gru",
  voteAverage: 7.8,
  genres: [
    Genres(name: 'Family', id: 10751),
  ],
);

List<Recommendation> recommendationDummy = [
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
];
*/
