import 'package:flutter/material.dart';
import 'package:quiz_app_practice/constants.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...summaryData.map((data) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:
                            (data['correctAnswer'] == data['userChosenAnswer'])
                                ? Colors.green
                                : Colors.redAccent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Text(
                          ((data['questionNumber'] as int) + 1).toString(),
                          style: TextStyle(
                            color: kTextColour,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question : ${data['questionText']}',
                        style: TextStyle(
                          color: kTextColour,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        ('Correct Answer :  ${data['correctAnswer']}'),
                        style: TextStyle(
                          color: kTextColour,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        ('Your Answer : ${data['userChosenAnswer']}'),
                        style: TextStyle(
                          color: (data['correctAnswer'] ==
                                  data['userChosenAnswer'])
                              ? Colors.green
                              : Colors.redAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
