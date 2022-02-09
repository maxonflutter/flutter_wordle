import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle/models/word_model.dart';
import '/blocs/blocs.dart';
import '/screens/screens.dart';
import 'models/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WordleBloc()
            ..add(
              const LoadGame(
                solution: Word(letters: <Letter>[
                  Letter(letter: 'G'),
                  Letter(letter: 'A'),
                  Letter(letter: 'M'),
                  Letter(letter: 'E'),
                  Letter(letter: 'S'),
                ]),
              ),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
