import 'package:flutter/foundation.dart';

import '../models/quiz_questions.dart';

class QuizProgress extends ChangeNotifier {
  int currentQuestionIndex = 0;

  final List<int?> confirmedAnswers =
      List<int?>.filled(quizQuestions.length, null);

  bool isAnswerConfirmed = false;

  int get totalQuestions => quizQuestions.length;

  int get correctAnswersCount {
    var count = 0;

    for (var i = 0; i < confirmedAnswers.length; i++) {
      if (confirmedAnswers[i] ==
          quizQuestions[i].correctAnswerIndex) {
        count++;
      }
    }

    return count;
  }

  double get percentage =>
      totalQuestions == 0 ? 0 : correctAnswersCount / totalQuestions * 100;

  bool get isFinished => currentQuestionIndex >= totalQuestions;

  void confirmAnswer(int answerIndex) {
    if (isFinished || isAnswerConfirmed) return;

    confirmedAnswers[currentQuestionIndex] = answerIndex;
    isAnswerConfirmed = true;
    notifyListeners();

    debugPrint(
      'Підтверджено відповідь на питання '
      '${currentQuestionIndex + 1}: $answerIndex',
    );
  }

  void nextQuestion() {
    if (!isAnswerConfirmed || isFinished) return;

    currentQuestionIndex++;
    isAnswerConfirmed = false;
    notifyListeners();
  }

  void restart() {
    currentQuestionIndex = 0;
    isAnswerConfirmed = false;
    confirmedAnswers.fillRange(0, confirmedAnswers.length, null);
    notifyListeners();
  }
}
