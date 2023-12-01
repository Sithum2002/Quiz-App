import 'package:flutter/material.dart';
import 'quiz_provider.dart';
import 'home_screen.dart';
import 'questions_screen.dart';
import 'results_screen.dart';
import 'review_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(const Color(0xFF560E09)),
      ),
      navigatorKey: navigatorKey,
      title: 'Quiz Master',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/questions': (context) => const QuestionsScreen(),
        '/results': (context) => const ResultsScreen(),
        '/review': (context) => const ReviewScreen(),
      },
    );
  }

  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(
      color.value,
      <int, Color>{
        50: color,
        100: color,
        200: color,
        300: color,
        400: color,
        500: color,
        600: color,
        700: color,
        800: color,
        900: color,
      },
    );
  }
}
