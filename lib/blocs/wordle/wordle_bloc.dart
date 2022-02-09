import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '/models/models.dart';

part 'wordle_event.dart';
part 'wordle_state.dart';

class WordleBloc extends Bloc<WordleEvent, WordleState> {
  WordleBloc() : super(WordleLoading()) {
    on<LoadGame>(_onLoadGame);
    on<UpdateGuess>(_onUpdateGuess);
    on<ValidateGuess>(_onValidateGuess);
  }

  void _onLoadGame(
    LoadGame event,
    Emitter<WordleState> emit,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    var dictionary = await rootBundle.loadString('/words.txt');

    emit(
      WordleLoaded(
        solution: event.solution,
        dictionary: dictionary
            .split('\n')
            .asMap()
            .entries
            .map(
              (word) => Word(
                id: word.key,
                letters: word.value
                    .split('')
                    .map(
                      (e) => Letter(
                        id: 1000 + Random().nextInt(10000),
                        letter: e,
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
        guesses: Word.guesses,
      ),
    );
  }

  void _onUpdateGuess(
    UpdateGuess event,
    Emitter<WordleState> emit,
  ) {
    final state = this.state;
    if (state is WordleLoaded) {
      int letterCount = state.letterCount + 1;
      List<Word> guesses = (state.guesses.map((word) {
        return word.id == event.word.id ? event.word : word;
      })).toList();

      emit(
        WordleLoaded(
          solution: state.solution,
          dictionary: state.dictionary,
          guesses: guesses,
          letterCount: letterCount,
        ),
      );

      if (letterCount % 5 == 0) {
        print('Validating ${event.word}');
        add(
          ValidateGuess(word: event.word),
        );
      }
    }
  }

  void _onValidateGuess(
    ValidateGuess event,
    Emitter<WordleState> emit,
  ) {
    final state = this.state;
    if (state is WordleLoaded) {
      Word solution = state.solution;

      var missing = [];
      var present = [];
      var correct = [];

      if (identical(solution, event.word.letters)) {
        // You win
        print('You win');
      } else {
        event.word.letters.asMap().forEach((index, value) {
          if (identical(value, solution.letters[index])) correct.add(value);
          if (solution.letters.contains(value)) present.add(value);
          if (!solution.letters.contains(value)) missing.add(value);
        });
      }
      print(missing);
      print(present);
      print(correct);
    }
  }
}
