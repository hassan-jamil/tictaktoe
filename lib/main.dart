import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';
import 'tic_tac_toe_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: const TicTacToeApp(),
    ),
  );
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const TicTacToePage(),
    );
  }
}
