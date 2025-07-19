import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class GameProvider extends ChangeNotifier {
  List<String> board = List.filled(9, '');
  bool xTurn = true;
  String winner = '';
  int xScore = 0;
  int oScore = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playTapSound() {
    _audioPlayer.play(AssetSource('sounds/tap.wav'));
  }

  void playWinSound() {
    _audioPlayer.play(AssetSource('sounds/win.wav'));
  }

  void handleTap(int index) {
    if (board[index] != '' || winner != '') return;

    board[index] = xTurn ? 'X' : 'O';
    playTapSound();
    xTurn = !xTurn;

    winner = checkWinner();
    if (winner == 'X') xScore++;
    if (winner == 'O') oScore++;
    if (winner != '' && winner != 'Draw') playWinSound();

    notifyListeners();
  }

  String checkWinner() {
    const winPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      final a = pattern[0], b = pattern[1], c = pattern[2];
      if (board[a] != '' && board[a] == board[b] && board[a] == board[c]) {
        return board[a];
      }
    }

    if (!board.contains('')) return 'Draw';
    return '';
  }

  void resetBoard() {
    board = List.filled(9, '');
    xTurn = true;
    winner = '';
    notifyListeners();
  }

  void resetScores() {
    xScore = 0;
    oScore = 0;
    notifyListeners();
  }
}
