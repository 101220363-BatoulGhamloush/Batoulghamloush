import 'dart:math';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String playerChoice = '❓';
  String computerChoice = '❓';
  String result = '';
  int playerScore = 0;
  int computerScore = 0;

  final List<String> choices = ['Rock', 'Paper', 'Scissors'];
  String getComputerChoice() {
    final random = Random();
    return choices[random.nextInt(3)];
  }
  void playGame(String playerSelection) {
    setState(() {
      playerChoice = playerSelection;
      computerChoice = getComputerChoice();

      if (playerChoice == computerChoice) {
        result = 'It\'s a Tie!';
      } else if ((playerChoice == 'Rock' && computerChoice == 'Scissors') ||
          (playerChoice == 'Paper' && computerChoice == 'Rock') ||
          (playerChoice == 'Scissors' && computerChoice == 'Paper')) {
        result = 'You Win!';
        playerScore++;
      } else {
        result = 'You Lose!';
        computerScore++;
      }
    });
  }
  void resetGame() {
    setState(() {
      playerChoice = '';
      computerChoice = '';
      result = '';
      playerScore = 0;
      computerScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock Paper Scissors'),
        backgroundColor: const Color.fromARGB(255, 255, 68, 208),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Player Score: $playerScore',
                style: const TextStyle(fontSize: 18)),
            Text('Computer Score: $computerScore',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text('Player Choice: $playerChoice',
                style: const TextStyle(fontSize: 18)),
            Text('Computer Choice: $computerChoice',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text(result,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => playGame('Rock'),
                  child: const Text(
                    '✊', 
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () => playGame('Paper'),
                  child: const Text(
                    '🖐️', 
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () => playGame('Scissors'),
                  child: const Text(
                    '✌️', 
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: resetGame,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}