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
        if (state is WordleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WordleLoaded) {
          var letters = state.guesses
              .expand((element) => element.letters)
              .where((element) => element != null)
              .toSet();

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...firstRow.map(
                    (letter) => CustomKey(
                      text: letter,
                      evaluation: letters,
                      onTap: () {
                        var wordIndex = (state.letterCount / 5).floor();
                        var letterIndex = state.letterCount % 5;
                        var letters = state.guesses[wordIndex].letters;

                        letters[letterIndex] = Letter(
                          id: state.letterCount,
                          letter: letter,
                          evaluation: Evaluation.pending,
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
                      evaluation: letters,
                      onTap: () {
                        var wordIndex = (state.letterCount / 5).floor();
                        var letterIndex = state.letterCount % 5;
                        var letters = state.guesses[wordIndex].letters;

                        letters[letterIndex] = Letter(
                          id: state.letterCount,
                          letter: letter,
                          evaluation: Evaluation.pending,
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
                  ...thirdRow.map(
                    (letter) => CustomKey(
                      text: letter,
                      evaluation: letters,
                      onTap: () {
                        var wordIndex = (state.letterCount / 5).floor();
                        var letterIndex = state.letterCount % 5;
                        var letters = state.guesses[wordIndex].letters;

                        letters[letterIndex] = Letter(
                          id: state.letterCount,
                          letter: letter,
                          evaluation: Evaluation.pending,
                        );

                        var updatedWord =
                            state.guesses[wordIndex].copyWith(letters: letters);

                        context.read<WordleBloc>().add(
                              UpdateGuess(word: updatedWord),
                            );
                      },
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.transparent,
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
                      onTap: () {
                        if (state.letterCount % 5 != 0) {
                          var wordIndex = (state.letterCount / 5).floor();
                          var letterIndex = (state.letterCount - 1) % 5;
                          var letters = state.guesses[wordIndex].letters;

                          letters.removeAt(letterIndex);
                          letters.add(null);

                          var updatedWord = state.guesses[wordIndex]
                              .copyWith(letters: letters);

                          context.read<WordleBloc>().add(
                                UpdateGuess(
                                  word: updatedWord,
                                  isBackArrow: true,
                                ),
                              );
                        }
                      },
                      child: Center(
                        child: Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }
}
