import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 126, 126),
      appBar: AppBar(
        title: const Text(
          'Quiz Master',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'MyFont',
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(
                'assets/images/faq(2).png',
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/questions');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(30.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                ),
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 30, fontFamily: 'MyFont'),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: const Opacity(
              opacity: 0.7,
              child: Text(
                'Version 1.0.0.1',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
