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
        dictionary:
            dictionary.split('\n').map((word) => word.toLowerCase()).toList(),
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
      int letterCount;
      switch (event.isBackArrow) {
        case true:
          letterCount = state.letterCount - 1;
          break;
        default:
          letterCount = state.letterCount + 1;
      }

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

      if (letterCount % 5 == 0 && !event.isBackArrow) {
        if (state.dictionary.contains(
          event.word.letters
              .map((letter) => letter!.letter)
              .join()
              .toLowerCase(),
        )) {
          add(
            ValidateGuess(word: event.word),
          );
        } else {
          List<Word> guesses = (state.guesses.map((word) {
            return word.id == event.word.id
                ? Word(
                    id: event.word.id,
                    letters: List.generate(5, (index) => null))
                : word;
          })).toList();

          emit(
            WordleLoaded(
              solution: state.solution,
              dictionary: state.dictionary,
              guesses: guesses,
              letterCount: letterCount - 5,
              isNotInDictionary: true,
            ),
          );
        }
      }
    }
  }

  void _onValidateGuess(
    ValidateGuess event,
    Emitter<WordleState> emit,
  ) {
    final state = this.state;
    if (state is WordleLoaded) {
      List<String> solution =
          state.solution.letters.map((letter) => letter!.letter).toList();
      List<String> guess =
          event.word.letters.map((letter) => letter!.letter).toList();
      List<Letter?> letters = event.word.letters;

      if (listEquals(solution, guess)) {
        emit(WordleSolved());
      } else {
        guess.asMap().forEach(
          (index, value) {
            if (identical(guess[index], solution[index])) {
              letters[index] = letters[index]!.copyWith(
                evaluation: Evaluation.correct,
              );
            } else if (solution.contains(guess[index])) {
              letters[index] = letters[index]!.copyWith(
                evaluation: Evaluation.present,
              );
            } else {
              letters[index] = letters[index]!.copyWith(
                evaluation: Evaluation.missing,
              );
            }
          },
        );
        List<Word> validatedGuesses = state.guesses.map((guess) {
          return guess.id == event.word.id ? event.word : guess;
        }).toList();

        emit(
          WordleLoaded(
            dictionary: state.dictionary,
            solution: state.solution,
            guesses: validatedGuesses,
            letterCount: state.letterCount,
          ),
        );
      }
    }
  }
}
