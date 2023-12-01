// review_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_provider.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final quizData = quizProvider.quizData;

    return Scaffold(
      appBar: AppBar(title: const Text('Review Answers')),
      body: ListView.builder(
        itemCount: quizData.length,
        itemBuilder: (context, index) {
          if (index < 0 || index >= quizData.length) {
            return const Text('Error: Index out of bounds');
          }

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      quizData[index].correctAnswerIndex == index
                          ? const Icon(Icons.check, color: Colors.green)
                          : const Icon(Icons.close, color: Colors.red),
                      const SizedBox(width: 8.0),
                      Text(
                        quizData[index].question,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text('Your Answer: ${quizData[index].answers.length > index ? quizData[index].answers[index] : 'N/A'}'),
                  Text('Correct Answer: ${quizData[index].answers.length > quizData[index].correctAnswerIndex ? quizData[index].answers[quizData[index].correctAnswerIndex] : 'N/A'}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}