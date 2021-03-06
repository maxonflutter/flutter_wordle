part of 'wordle_bloc.dart';

abstract class WordleEvent extends Equatable {
  const WordleEvent();

  @override
  List<Object> get props => [];
}

class LoadGame extends WordleEvent {
  final Word solution;

  const LoadGame({required this.solution});

  @override
  List<Object> get props => [solution];
}

class UpdateGuess extends WordleEvent {
  final Word word;
  final bool isBackArrow;

  const UpdateGuess({
    required this.word,
    this.isBackArrow = false,
  });

  @override
  List<Object> get props => [word, isBackArrow];
}

class ValidateGuess extends WordleEvent {
  final Word word;

  const ValidateGuess({required this.word});

  @override
  List<Object> get props => [word];
}
