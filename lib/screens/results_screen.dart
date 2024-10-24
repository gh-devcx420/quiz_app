import 'package:flutter/material.dart';
import 'package:quiz_app_practice/constants.dart';
import 'package:quiz_app_practice/data/quiz_questions.dart';
import 'package:quiz_app_practice/widgets/quiz_summary_display.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {required this.restartQuiz, required this.userAnswerList, super.key});

  final List<String> userAnswerList;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryDataList = [];

    for (int i = 0; i < userAnswerList.length; i++) {
      summaryDataList.add({
        'questionNumber': i,
        'questionText': questions[i].questionText,
        'correctAnswer': questions[i].answers[0],
        'userChosenAnswer': userAnswerList[i],
      });
    }
    return summaryDataList;
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final summary = getSummaryData();
    final int numTotalAnswers = questions.length;
    final numCorrectAnswers = summary
        .where((data) => data['correctAnswer'] == data['userChosenAnswer'])
        .length;

    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalAnswers questions Correctly',
              style: TextStyle(
                color: kTextColour,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: deviceHeight * 0.6,
              child: Scrollbar(
                //thumbVisibility: true,
                thickness: 3,
                radius: const Radius.circular(20),
                child: SingleChildScrollView(
                  child: QuizSummary(
                    summaryData: summary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: restartQuiz,
              style: OutlinedButton.styleFrom(
                backgroundColor: kButtonColour,
                side: BorderSide(
                  width: 2.0,
                  color: kTextColour,
                ),
              ),
              icon: Icon(
                Icons.refresh,
                color: kTextColour,
              ),
              label: Text(
                'Restart Quiz',
                style: TextStyle(
                  color: kTextColour,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
