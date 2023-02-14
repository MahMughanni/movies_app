class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '2822a930b0736e9085344f2fb46a90e3';


  static const String nowPlayingMovePath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';




  static const String getPopularMoviePath =
      '$baseUrl/movie/popular?api_key=$apiKey';



  static const String getTopRatedMoviePath = '$baseUrl/movie/top_rated?api_key=$apiKey';





  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String? path) => '$baseImageUrl$path';
}
