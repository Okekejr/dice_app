import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(
            child: Text(
              'Dice App',
              style: TextStyle(color: Colors.white),
            ),
          )),
      body: const DiceApp(),
    ),
  ));
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftDie = 1;
  int rightDie = 3;

  int randomNum() {
    var random = Random();
    int min = 1;
    int max = 5;
    int randomNumber = min + random.nextInt(max - min + 1);
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    leftDie = randomNum();
                    rightDie = randomNum();
                  });
                },
                child: Image.asset('images/dice$leftDie.png')),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    rightDie = randomNum();
                    leftDie = randomNum();
                  });
                },
                child: Image.asset('images/dice$rightDie.png')),
          ),
        ],
      ),
    );
  }
}
