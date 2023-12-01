import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_provider.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final int score = Provider.of<QuizProvider>(context).score;
    final String imageAsset =
        (score >= 5) ? 'assets/images/medal.png' : 'assets/images/delete.png';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140.0),
        child: AppBar(
          title: const Text(
            'Results',
            style: TextStyle(
              fontFamily: 'MyFont',
              fontSize: 50,
            ),
          ),
          centerTitle: true,
          backgroundColor: _getResultBackgroundColor(score),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Score: $score/10',
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      _getScoreMessage(score),
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Mine',
                        color: _getScoreColor(score),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      imageAsset,
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 120),
            ElevatedButton(
              onPressed: () {
                _resetQuizAndNavigateHome(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _navigateToReviewAnswers(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
                ),
              ),
              child: const Text(
                'Review Answers',
                style: TextStyle(fontFamily: 'MyFont', fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getResultBackgroundColor(int score) {
    if (score >= 5) {
      return const Color.fromARGB(255, 44, 127, 47);
    } else if (score == 5) {
      return Colors.blue;
    } else {
      return const Color.fromARGB(255, 149, 26, 18);
    }
  }

  String _getScoreMessage(int score) {
    if (score >= 5) {
      return 'Great';
    } else if (score == 5) {
      return 'Good but Try more';
    } else {
      return 'Weak';
    }
  }

  Color _getScoreColor(int score) {
    if (score >= 5) {
      return Colors.green;
    } else if (score == 5) {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }

  void _resetQuizAndNavigateHome(BuildContext context) {
    Provider.of<QuizProvider>(context, listen: false).resetQuiz();
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  void _navigateToReviewAnswers(BuildContext context) {
    Navigator.pushNamed(context, '/review');
  }
}
