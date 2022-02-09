import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle/blocs/blocs.dart';
import 'package:flutter_wordle/models/models.dart';
import 'package:flutter_wordle/widgets/custom_key.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> firstRow = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
    List<String> secondRow = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
    List<String> thirdRow = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];

    return BlocBuilder<WordleBloc, WordleState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...firstRow.map(
                  (letter) => CustomKey(
                    text: letter,
                    onTap: () {
                      var wordIndex =
                          ((state as WordleLoaded).letterCount / 5).floor();
                      var letterIndex = state.letterCount % 5;

                      var letters = state.guesses[wordIndex].letters;

                      letters[letterIndex] = Letter(
                        id: state.letterCount,
                        letter: letter,
                      );

                      var updatedWord =
                          state.guesses[wordIndex].copyWith(letters: letters);

                      context.read<WordleBloc>().add(
                            UpdateGuess(word: updatedWord),
                          );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...secondRow.map(
                  (letter) => CustomKey(
                    text: letter,
                    onTap: () {
                      var wordIndex =
                          ((state as WordleLoaded).letterCount / 5).floor();
                      var letterIndex = state.letterCount % 5;

                      var letters = state.guesses[wordIndex].letters;

                      letters[letterIndex] = Letter(
                        id: state.letterCount,
                        letter: letter,
                      );

                      var updatedWord =
                          state.guesses[wordIndex].copyWith(letters: letters);

                      context.read<WordleBloc>().add(
                            UpdateGuess(word: updatedWord),
                          );
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...thirdRow.map(
                  (letter) => CustomKey(
                    text: letter,
                    onTap: () {
                      var wordIndex =
                          ((state as WordleLoaded).letterCount / 5).floor();
                      var letterIndex = state.letterCount % 5;

                      var letters = state.guesses[wordIndex].letters;

                      letters[letterIndex] = Letter(
                        id: state.letterCount,
                        letter: letter,
                      );

                      var updatedWord =
                          state.guesses[wordIndex].copyWith(letters: letters);

                      context.read<WordleBloc>().add(
                            UpdateGuess(word: updatedWord),
                          );
                    },
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
