import 'package:equatable/equatable.dart';
import 'package:flutter_wordle/models/models.dart';

class Word extends Equatable {
  final int? id;
  final List<Letter?> letters;

  const Word({
    this.id,
    required this.letters,
  });

  @override
  List<Object?> get props {
    return [
      id,
      letters,
    ];
  }

  Word copyWith({
    int? id,
    List<Letter?>? letters,
  }) {
    return Word(
      id: id ?? this.id,
      letters: letters ?? this.letters,
    );
  }

  static List<Word> guesses = [
    Word(id: 0, letters: List.generate(5, (index) => null)),
    Word(id: 1, letters: List.generate(5, (index) => null)),
    Word(id: 2, letters: List.generate(5, (index) => null)),
    Word(id: 3, letters: List.generate(5, (index) => null)),
    Word(id: 4, letters: List.generate(5, (index) => null)),
    Word(id: 5, letters: List.generate(5, (index) => null)),
  ];
}
