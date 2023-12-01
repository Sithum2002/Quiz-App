import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_provider.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final currentQuestion = quizProvider.quizData[quizProvider.currentIndex];

    //list of Map entries with original index and answer
    final List<MapEntry<int, String>> indexedAnswers = currentQuestion.answers
        .asMap()
        .entries
        .toList();

    // Shuffle the answers(not change original)
    indexedAnswers.shuffle();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text(
            'Questions',
            style: TextStyle(fontSize: 50, fontFamily: 'MyFont'),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 8, 45, 75),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: const TextStyle(
              fontSize: 40,
              fontFamily: 'MyFont',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Column(
            children: List.generate(
              4,
              (index) => ElevatedButton(
                onPressed: () {
                  Provider.of<QuizProvider>(context, listen: false)
                      .answerQuestion(indexedAnswers[index].key);
                },
                child: Text(
                  indexedAnswers[index].value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
