import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';

class TicTacToePage extends StatelessWidget {
  const TicTacToePage({super.key});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 6,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 8,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      game.winner == ''
                          ? 'Turn: ${game.xTurn ? '❌' : '⭕'}'
                          : (game.winner == 'Draw'
                          ? '🤝 Game Draw!'
                          : '🎉 Winner: ${game.winner}'),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: game.winner == 'X'
                            ? Colors.blue
                            : game.winner == 'O'
                            ? Colors.red
                            : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '❌ X: ${game.xScore}   ⭕ O: ${game.oScore}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => game.handleTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(2, 3),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        game.board[index],
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: game.board[index] == 'X'
                              ? Colors.blue
                              : game.board[index] == 'O'
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: game.resetBoard,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Restart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: game.resetScores,
                  icon: const Icon(Icons.clear),
                  label: const Text('Reset Scores'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
