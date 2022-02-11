part of 'wordle_bloc.dart';

abstract class WordleState extends Equatable {
  const WordleState();

  @override
  List<Object?> get props => [];
}

class WordleLoading extends WordleState {}

class WordleLoaded extends WordleState {
  final Word solution;
  final List<String> dictionary;
  final List<Word> guesses;
  final int letterCount;
  final bool isNotInDictionary;

  const WordleLoaded({
    required this.solution,
    required this.dictionary,
    required this.guesses,
    this.letterCount = 0,
    this.isNotInDictionary = false,
  });

  @override
  List<Object?> get props => [
        dictionary,
        guesses,
        letterCount,
        solution,
        isNotInDictionary,
      ];
}

class WordleSolved extends WordleState {}
