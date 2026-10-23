import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String text;
  final bool selected;
  final bool correct;
  final bool showCorrect;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.text,
    required this.selected,
    required this.correct,
    required this.showCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isCorrect = showCorrect && correct;
    final isWrong = showCorrect && selected && !correct;

    final color = isCorrect
        ? Colors.green.shade100
        : isWrong
            ? Colors.red.shade100
            : selected
                ? Colors.blue.shade100
                : Colors.white;

    return Card(
      color: color,
      child: ListTile(
        title: Text(text),
        trailing: isCorrect
            ? const Icon(Icons.check_circle, color: Colors.green)
            : isWrong
                ? const Icon(Icons.cancel, color: Colors.red)
                : null,
        onTap: showCorrect ? null : onTap,
      ),
    );
  }
}
