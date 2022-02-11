import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  ) async {}

  void _onUpdateGuess(
    UpdateGuess event,
    Emitter<WordleState> emit,
  ) {}

  void _onValidateGuess(
    ValidateGuess event,
    Emitter<WordleState> emit,
  ) {}
}
