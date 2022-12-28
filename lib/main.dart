import 'package:flutter/material.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app/data/repository/movies_repository.dart';
import 'package:movies_app/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/presentation/screens/movies_screen.dart';

import 'domain/repository/base_movies_repository.dart';

void main() {

  //
  // BaseMovieRemoteDataSource baseMovieRemoteDataSource = MovieRemoteDataSource() ;
  // BaseMoviesRepository baseMoviesRepository = MoviesRepository(baseMovieRemoteDataSource) ;
  // GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase = GetNowPlayingMoviesUseCase(baseMoviesRepository);

  // print(getNowPlayingMoviesUseCase.baseMoviesRepository) ;


  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Test1(),
    );
  }
}

class Test1 extends StatelessWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return MoviesScreen();
          }));
        },
        child: const Center(child: Text('go to ' , style: TextStyle(color: Colors.black , fontSize: 30),)),
      ),
    );
  }
}
