import 'package:equatable/equatable.dart';

enum LetterValidationStatus { pending, correct, missing, present }

class Letter extends Equatable {
  final int? id;
  final String letter;

  const Letter({
    this.id,
    required this.letter,
  });

  @override
  List<Object?> get props => [id, letter];

  Letter copyWith({
    int? id,
    String? letter,
    LetterValidationStatus? letterValidationStatus,
  }) {
    return Letter(
      id: id ?? this.id,
      letter: letter ?? this.letter,
    );
  }

  static List<Letter> letters = const [
    Letter(
      id: 0,
      letter: 'A',
    ),
  ];
}
