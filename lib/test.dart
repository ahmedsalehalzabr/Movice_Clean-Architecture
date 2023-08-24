import 'package:flutter/material.dart';
import 'package:tv_movice/movies/presentation/screens/movies_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: TextButton(
         onPressed: () {
           Navigator.push(context,
               MaterialPageRoute(builder: (BuildContext context) {
             return const MoviesScreen();
           }));
         },
       child: const Text('Navigate'),
       ),
     ),
   );
  }

}