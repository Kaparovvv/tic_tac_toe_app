import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/presentation/screens/game_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}
