import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'quiz_data.dart';

class QuizProvider extends ChangeNotifier {
  List<QuizData> quizData = [];
  int currentIndex = 0;
  int score = 0;

  QuizProvider() {
    loadQuizData();
  }

  Future<void> loadQuizData() async {
    try {
      String jsonData = await rootBundle.loadString('assets/quiz_data.json');
      List<dynamic> decodedData = jsonDecode(jsonData)['questions'];
      quizData = decodedData
          .map((data) => QuizData(
                question: data['question'],
                answers: List<String>.from(data['answers']),
                correctAnswerIndex: data['correctAnswerIndex'],
              ))
          .toList();
    } catch (error) {
      if (kDebugMode) {
        print('Error loading quiz data: $error');
      }
    }

    notifyListeners();
  }

  void reloadQuizData() {
    loadQuizData();
  }

  void answerQuestion(int selectedAnswerIndex) {
    if (selectedAnswerIndex == quizData[currentIndex].correctAnswerIndex) {
      score++;
    }

    if (currentIndex < quizData.length - 1) {
      currentIndex++;
    } else {
      Navigator.pushReplacementNamed(
        navigatorKey.currentContext!,
        '/results',
      );
    }

    notifyListeners();
  }

  void resetQuiz() {
    currentIndex = 0;
    score = 0;
    notifyListeners();
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();