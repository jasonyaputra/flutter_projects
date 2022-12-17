// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'dart:async';

class Game extends StatefulWidget {
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> characters = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  String result = '';

  bool oTurn = true;

  int filledBoxes = 0;
  List<int> matchedIndexes = [];

  int attempts = 0;

  Timer? timer;
  static const maxSeconds = 30;
  int seconds = maxSeconds;

  void check() {
    if (characters[0] == characters[1] &&
        characters[0] == characters[2] &&
        characters[0] != '') {
      setState(() {
        result = "Player " + characters[0] + " wins!";
        matchedIndexes.addAll([0, 1, 2]);
        stopTimer();
        updateScore(characters[0]);
      });
    } else if (characters[3] == characters[4] &&
        characters[3] == characters[5] &&
        characters[3] != '') {
      setState(() {
        result = "Player " + characters[3] + " wins!";
        matchedIndexes.addAll([3, 4, 5]);
        stopTimer();
        updateScore(characters[3]);
      });
    } else if (characters[6] == characters[7] &&
        characters[6] == characters[8] &&
        characters[6] != '') {
      setState(() {
        result = "Player " + characters[6] + " wins!";
        matchedIndexes.addAll([6, 7, 8]);
        stopTimer();
        updateScore(characters[6]);
      });
    } else if (characters[0] == characters[3] &&
        characters[0] == characters[6] &&
        characters[0] != '') {
      setState(() {
        result = "Player " + characters[0] + " wins!";
        matchedIndexes.addAll([0, 3, 6]);
        stopTimer();
        updateScore(characters[0]);
      });
    } else if (characters[1] == characters[4] &&
        characters[1] == characters[7] &&
        characters[1] != '') {
      setState(() {
        result = "Player " + characters[1] + " wins!";
        matchedIndexes.addAll([1, 4, 7]);
        stopTimer();
        updateScore(characters[1]);
      });
    } else if (characters[2] == characters[5] &&
        characters[2] == characters[8] &&
        characters[2] != '') {
      setState(() {
        result = "Player " + characters[2] + " wins!";
        matchedIndexes.addAll([2, 5, 8]);
        stopTimer();
        updateScore(characters[2]);
      });
    } else if (characters[0] == characters[4] &&
        characters[0] == characters[8] &&
        characters[0] != '') {
      setState(() {
        result = "Player " + characters[0] + " wins!";
        matchedIndexes.addAll([0, 4, 8]);
        stopTimer();
        updateScore(characters[0]);
      });
    } else if (characters[6] == characters[4] &&
        characters[6] == characters[2] &&
        characters[6] != '') {
      setState(() {
        result = "Player " + characters[6] + " wins!";
        matchedIndexes.addAll([6, 2, 4]);
        stopTimer();
        updateScore(characters[6]);
      });
    } else if (filledBoxes == 9) {
      setState(() {
        result = "Tie";
        stopTimer();
      });
    }
  }

  void updateScore(String winner) {
    if (winner == "O") {
      oScore++;
    } else if (winner == "X") {
      xScore++;
    }
  }

  void clear() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        characters[i] = '';
      }
      result = '';
      matchedIndexes = [];
    });
    filledBoxes = 0;
  }

  void tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;

    if (isRunning) {
      setState(() {
        if (oTurn && characters[index] == '') {
          characters[index] = 'O';
          filledBoxes++;
        } else if (!oTurn && characters[index] == '') {
          characters[index] = 'X';
          filledBoxes++;
        }
        oTurn = !oTurn;
        check();
      });
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() {
    seconds = maxSeconds;
  }

  Widget _buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;

    return isRunning
        ? SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxSeconds,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                  backgroundColor: Colors.blue,
                ),
                Center(
                  child: Text(
                    '$seconds',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        : ElevatedButton(
            onPressed: () {
              startTimer();
              clear();
              attempts++;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
            child: Text(
              attempts > 0 ? "Play again" : "Start",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 40, 40),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Player O",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 3,
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          oScore.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 3,
                            fontSize: 28,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Player X",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 3,
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          xScore.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 3,
                            fontSize: 28,
                          ),
                        )
                      ],
                    )
                  ],
                )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: Colors.red,
                        ),
                        color: matchedIndexes.contains(index)
                            ? Color.fromARGB(255, 16, 219, 22)
                            : Color.fromARGB(255, 99, 97, 95),
                      ),
                      child: Center(
                        child: Text(
                          characters[index],
                          style: TextStyle(
                            color: Colors.red,
                            letterSpacing: 3,
                            fontSize: 64,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 3,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildTimer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
