import 'package:flutter/material.dart';
import 'package:quiz_app_practice/constants.dart';
import 'package:quiz_app_practice/data/quiz_questions.dart';
import 'package:quiz_app_practice/widgets/quiz_answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.selectAnswer, super.key});

  final void Function(String) selectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void chooseAnswer(String answer) {
    setState(() {
      currentQuestionIndex++;
      widget.selectAnswer(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: kTextColour,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  chooseAnswer(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
