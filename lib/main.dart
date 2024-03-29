import 'package:flutter/material.dart';
import 'package:movies_app/core/services/services_locator.dart';

import 'package:movies_app/presentation/screens/movies_screen.dart';
import 'package:movies_app/utils/app_string.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStringConstants.appName,
      theme: ThemeData.dark().copyWith(backgroundColor: Colors.grey.shade800),
      home: const MoviesScreen(),
    );
  }
}
