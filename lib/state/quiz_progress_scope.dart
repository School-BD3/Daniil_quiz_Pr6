import 'package:flutter/widgets.dart';

import 'quiz_progress.dart';

class QuizProgressScope extends InheritedNotifier<QuizProgress> {
  const QuizProgressScope({
    super.key,
    required QuizProgress notifier,
    required super.child,
  }) : super(notifier: notifier);

  static QuizProgress of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<QuizProgressScope>();

    assert(scope != null, 'QuizProgressScope не знайдено в дереві віджетів');

    return scope!.notifier!;
  }
}
