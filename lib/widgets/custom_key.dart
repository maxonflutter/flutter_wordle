import 'package:flutter/material.dart';
import 'package:flutter_wordle/models/models.dart';

class CustomKey extends StatelessWidget {
  const CustomKey({
    Key? key,
    required this.text,
    required this.evaluation,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Set<Letter?> evaluation;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    List<Letter?> letterEvaluation =
        evaluation.where((letter) => letter!.letter == text).toList();

    Color color = (letterEvaluation.isNotEmpty)
        ? letterEvaluation
                .any((letter) => letter!.evaluation == Evaluation.correct)
            ? Theme.of(context).colorScheme.secondary
            : letterEvaluation
                    .any((letter) => letter!.evaluation == Evaluation.present)
                ? Colors.yellow
                : letterEvaluation.any(
                        (letter) => letter!.evaluation == Evaluation.missing)
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.primary;

    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      margin: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
