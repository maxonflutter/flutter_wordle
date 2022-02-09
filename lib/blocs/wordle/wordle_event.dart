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

  const UpdateGuess({required this.word});

  @override
  List<Object> get props => [word];
}

class ValidateGuess extends WordleEvent {
  final Word word;

  const ValidateGuess({required this.word});

  @override
  List<Object> get props => [word];
}
