import 'package:flutter/material.dart';
import 'package:tv_movice/core/services/services_locator.dart';
import 'package:tv_movice/movies/presentation/screens/movies_screen.dart';
import 'package:tv_movice/test.dart';

void main() {
    ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}
