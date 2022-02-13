import 'package:equatable/equatable.dart';

enum Evaluation { pending, correct, missing, present }

class Letter extends Equatable {
  final int? id;
  final String letter;
  final Evaluation? evaluation;

  const Letter({
    this.id,
    required this.letter,
    required this.evaluation,
  });

  @override
  List<Object?> get props => [id, letter, evaluation];

  Letter copyWith({
    int? id,
    String? letter,
    Evaluation? evaluation,
  }) {
    return Letter(
      id: id ?? this.id,
      letter: letter ?? this.letter,
      evaluation: evaluation ?? this.evaluation,
    );
  }

  // static List<Letter> letters = const [
  //   Letter(
  //     id: 0,
  //     letter: 'A',
  //     evaluation: Evaluation.pending,
  //   ),
  // ];
}
