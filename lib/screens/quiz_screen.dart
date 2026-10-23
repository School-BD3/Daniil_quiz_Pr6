import 'package:flutter/material.dart';

import 'results_screen.dart';
import '../models/quiz_questions.dart';
import '../state/quiz_progress.dart';
import '../widgets/answer_option.dart';

class QuizScreen extends StatefulWidget {
  final QuizProgress progress;
  final void Function(int answerIndex) onConfirmAnswer;
  final VoidCallback onNextQuestion;
  final VoidCallback onRestart;

  const QuizScreen({
    super.key,
    required this.progress,
    required this.onConfirmAnswer,
    required this.onNextQuestion,
    required this.onRestart,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    final progress = widget.progress;

    if (progress.isFinished) {
      return ResultsScreen(
        progress: progress,
        onRestart: widget.onRestart,
      );
    }

    final question = quizQuestions[progress.currentQuestionIndex];
    final isConfirmed = progress.isAnswerConfirmed;
    final correctIndex = question.correctAnswerIndex;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Питання ${progress.currentQuestionIndex + 1} '
          'із ${progress.totalQuestions}',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                'Рахунок: ${progress.correctAnswersCount}',
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (progress.currentQuestionIndex + 1) /
                  progress.totalQuestions,
            ),
            const SizedBox(height: 24),
            Text(
              question.text,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: question.answers.length,
                itemBuilder: (context, index) {
                  return AnswerOption(
                    text: question.answers[index],
                    selected: selectedAnswerIndex == index,
                    correct: index == correctIndex,
                    showCorrect: isConfirmed,
                    onTap: () {
                      setState(() {
                        selectedAnswerIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            if (isConfirmed)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  selectedAnswerIndex == correctIndex
                      ? 'Правильно!'
                      : 'Неправильно. Правильна відповідь: '
                          '${question.answers[correctIndex]}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedAnswerIndex == correctIndex
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),
            FilledButton(
              onPressed: !isConfirmed && selectedAnswerIndex == null
                  ? null
                  : () {
                      if (!isConfirmed) {
                        widget.onConfirmAnswer(selectedAnswerIndex!);
                      } else {
                        widget.onNextQuestion();
                        setState(() {
                          selectedAnswerIndex = null;
                        });
                      }
                    },
              child: Text(
                !isConfirmed
                    ? 'Підтвердити відповідь'
                    : progress.currentQuestionIndex ==
                            progress.totalQuestions - 1
                        ? 'Завершити вікторину'
                        : 'Наступне питання',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
