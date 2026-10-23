import 'package:flutter/material.dart';

import 'screens/quiz_screen.dart';
import 'state/quiz_progress.dart';
import 'state/quiz_progress_scope.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final QuizProgress _progress = QuizProgress();

  @override
  void dispose() {
    _progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Вікторина Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: QuizProgressScope(
        notifier: _progress,
        child: const QuizScreen(),
      ),
    );
  }
}
