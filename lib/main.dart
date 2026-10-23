import 'package:flutter/material.dart';

import 'screens/quiz_screen.dart';
import 'state/quiz_progress.dart';

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

  void _confirmAnswer(int answerIndex) {
    setState(() {
      _progress.confirmedAnswers[_progress.currentQuestionIndex] =
          answerIndex;
      _progress.isAnswerConfirmed = true;
    });

    debugPrint(
      'Підтверджено відповідь на питання '
      '${_progress.currentQuestionIndex + 1}: $answerIndex',
    );
  }

  void _nextQuestion() {
    setState(() {
      _progress.currentQuestionIndex++;
      _progress.isAnswerConfirmed = false;
    });
  }

  void _restartQuiz() {
    setState(() {
      _progress.currentQuestionIndex = 0;
      _progress.isAnswerConfirmed = false;
      _progress.confirmedAnswers.fillRange(
        0,
        _progress.confirmedAnswers.length,
        null,
      );
    });
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
      home: QuizScreen(
        progress: _progress,
        onConfirmAnswer: _confirmAnswer,
        onNextQuestion: _nextQuestion,
        onRestart: _restartQuiz,
      ),
    );
  }
}
