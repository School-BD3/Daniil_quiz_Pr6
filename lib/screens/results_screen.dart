import 'package:flutter/material.dart';

import '../models/quiz_questions.dart';
import '../state/quiz_progress.dart';

class ResultsScreen extends StatelessWidget {
  final QuizProgress progress;
  final VoidCallback onRestart;

  const ResultsScreen({
    super.key,
    required this.progress,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final mistakes = <int>[];

    for (var i = 0; i < quizQuestions.length; i++) {
      final answer = progress.confirmedAnswers[i];

      if (answer != quizQuestions[i].correctAnswerIndex) {
        mistakes.add(i);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Результати вікторини'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(Icons.emoji_events, size: 72),
          const SizedBox(height: 16),
          Text(
            'Вікторину завершено!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 12),
          Text(
            '${progress.correctAnswersCount} із '
            '${progress.totalQuestions} правильних відповідей',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Результат: ${progress.percentage.toStringAsFixed(0)}%',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Помилки (${mistakes.length})',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          if (mistakes.isEmpty)
            const Card(
              child: ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text('Усі відповіді правильні!'),
              ),
            )
          else
            ...mistakes.map((index) {
              final question = quizQuestions[index];
              final userAnswer = progress.confirmedAnswers[index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Питання ${index + 1}: ${question.text}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Твоя відповідь: ${userAnswer == null ? "не надано" : question.answers[userAnswer]}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Правильна відповідь: '
                        '${question.answers[question.correctAnswerIndex]}',
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              );
            }),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: onRestart,
            child: const Text('Пройти ще раз'),
          ),
        ],
      ),
    );
  }
}
