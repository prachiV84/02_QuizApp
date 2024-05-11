/* import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen; //? will tell the dart that it contain a widget or null.
  /* @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  } */

//we can store widgets in variable.
//here widgets are objects and we can store objects in a variable
//here we cannot use var because var is restrictive so to do

  void switchScreen() {
    setState() {
      /* Calling setState notifies the framework that the internal state of 
                    this object has changed in a way that might impact the user interface in this subtree,
                     which causes the framework to schedule a build for this State object.
 */
      activeScreen = QuestionsScreen();
    }
  }

  @override
  Widget build(context) {
    /* final screenWiget = activeScreen=='start-screen'
                       ?StartScreen(switchScreen)
                       :QuestionsScreen(); */
    Widget screenwidget = StartScreen(switchScreen);
    screenwidget = QuestionsScreen();

    if (activeScreen == 'question-screen') {
      screenwidget = QuestionsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 230, 106, 203),
              Color.fromARGB(255, 138, 3, 105),
            ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
          ),
          child:activeScreen,
        ),
      ),
    );
  }
}
 */
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
