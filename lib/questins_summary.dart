import 'package:adv_basics/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(((data['question-index'])).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text((data['question'] as QuizQuestion).text),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answers'] as String),
                      Text(data['correct_answers'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
