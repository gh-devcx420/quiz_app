import 'package:flutter/material.dart';
import 'package:quiz_app_practice/constants.dart';
import 'package:quiz_app_practice/data/quiz_questions.dart';
import 'package:quiz_app_practice/screens/questions_screen.dart';
import 'package:quiz_app_practice/screens/results_screen.dart';
import 'package:quiz_app_practice/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;
  List<String> userAnswers = [];

  @override
  void initState() {
    super.initState();
    currentScreen = StartScreen(
      startQuiz: switchScreen,
    );
  }

  void switchScreen() {
    setState(() {
      currentScreen = QuestionsScreen(selectAnswer: selectAnswer);
    });
  }

  void selectAnswer(String answer) {
    userAnswers.add(answer);
    if (userAnswers.length == questions.length) {
      setState(() {
        currentScreen = ResultsScreen(
          userAnswerList: userAnswers,
          restartQuiz: restartQuiz,
        );
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentScreen = StartScreen(startQuiz: switchScreen);
      userAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kGradientColour1,
                kGradientColour2,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
