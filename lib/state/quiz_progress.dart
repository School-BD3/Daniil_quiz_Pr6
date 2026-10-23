import '../models/quiz_questions.dart';

class QuizProgress {
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
}
