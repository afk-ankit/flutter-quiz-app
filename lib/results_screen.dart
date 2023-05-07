import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'chosen_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final correctQuestions = summaryData.where(
      (data) {
        return data['chosen_answer'] == data['correct_answer'];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "You answered $correctQuestions questions out of $numTotalQuestions questions correctly",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummaryData()),
            TextButton(
                onPressed: () {
                  // print('hello');
                },
                child: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
