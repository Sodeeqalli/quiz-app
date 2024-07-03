import 'package:flutter/material.dart';
import 'package:quizapp/homepage.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/Data/questions.dart';
import './result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return QuizState();
  }
}

class QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> _selectedAnswers = [];

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      _selectedAnswers = [];
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = Homepage(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: _selectedAnswers,
        restart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 188, 44, 0),
                Color.fromARGB(255, 255, 153, 0)
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
