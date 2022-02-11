import 'package:flutter/material.dart';
import '/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
