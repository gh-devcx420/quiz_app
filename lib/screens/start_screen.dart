import 'package:flutter/material.dart';
import 'package:quiz_app_practice/constants.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({required this.startQuiz, super.key});

  final void Function() startQuiz;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Learn Flutter The Fun Way !',
            style: TextStyle(
              color: kTextColour,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: kTextColour,
              side: BorderSide(
                width: 2.0,
                color: kTextColour,
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: widget.startQuiz,
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
