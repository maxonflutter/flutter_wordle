import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  Letter(letter: 'G', evaluation: Evaluation.correct),
                  Letter(letter: 'A', evaluation: Evaluation.correct),
                  Letter(letter: 'M', evaluation: Evaluation.correct),
                  Letter(letter: 'E', evaluation: Evaluation.correct),
                  Letter(letter: 'S', evaluation: Evaluation.correct),
                ]),
              ),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Another Word Game',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF000A1F),
          colorScheme: const ColorScheme(
            primary: Color(0xFF11FFEE),
            primaryVariant: Color(0xFF11FFEE),
            secondary: Color(0xFFFFFFFF),
            secondaryVariant: Color(0xFFFFFFFF),
            background: Color(0xFF000A1F),
            surface: Color(0xFF000A1F),
            error: Color(0xDFFFFFFF),
            brightness: Brightness.light,
            onPrimary: Color(0xFF000A1F),
            onSecondary: Color(0xFF000A1F),
            onError: Color(0xFF2b2e4a),
            onBackground: Color(0xFF2b2e4a),
            onSurface: Color(0xFF2b2e4a),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF000A1F),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
