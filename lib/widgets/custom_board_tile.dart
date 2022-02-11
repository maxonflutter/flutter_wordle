import 'package:flutter/material.dart';
import 'package:flutter_wordle/models/models.dart';

class CustomBoardTile extends StatelessWidget {
  const CustomBoardTile({
    Key? key,
    required this.letters,
    required this.letterCount,
    required this.letterIndex,
  }) : super(key: key);

  final List<Letter?> letters;
  final int letterCount;
  final int letterIndex;

  @override
  Widget build(BuildContext context) {
    // Set up the color of the Board Tile
    Color color = (letterCount > letterIndex)
        // If the eval is equal to pending, no color.
        ? letters[letterIndex]!.evaluation == Evaluation.pending
            ? Colors.transparent
            // If the letter is correct, we use the light blue.
            : letters[letterIndex]!.evaluation == Evaluation.correct
                ? Theme.of(context).colorScheme.secondary
                // If the letter is correct, but not in the right spot, we use a yellow.
                : letters[letterIndex]!.evaluation == Evaluation.present
                    ? Colors.yellow
                    : Colors.transparent
        : Colors.transparent;

    // Set up the color of the Text
    Color textColor = (letterCount > letterIndex)
        // If the eval is equal to pending, no color.
        ? letters[letterIndex]!.evaluation == Evaluation.pending ||
                letters[letterIndex]!.evaluation == Evaluation.missing
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.background
        : Theme.of(context).colorScheme.secondary;

    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
        color: color,
      ),
      child: Center(
        child: (letterCount > letterIndex)
            ? Text(
                letters[letterIndex]!.letter,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                ),
              )
            : const Text(''),
      ),
    );
  }
}
