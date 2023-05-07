import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  List<String> selectedAnswers = [];
  String activeScreen = 'start_screen';
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget;
    if (activeScreen == 'start_screen') {
      screenWidget = StartScreen(switchScreen);
    } else if (activeScreen == 'quiz_screen') {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    } else {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 33, 0, 53),
              Color.fromARGB(255, 182, 0, 158),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
