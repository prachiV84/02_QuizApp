import 'package:adv_basics/data/questions.dart';

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String>
      answers; //this would remain untouched after the creation of new list.

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
