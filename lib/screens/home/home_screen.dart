import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/models/models.dart';
import '/blocs/blocs.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocConsumer<WordleBloc, WordleState>(
        listenWhen: (previous, current) {
          if (current is WordleLoaded) {
            return current.isNotInDictionary;
          }
          return false;
        },
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Word not in the dictionary'),
              duration: Duration(seconds: 1),
            ),
          );
        },
        builder: (context, state) {
          if (state is WordleLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }
          if (state is WordleLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBoard(state),
                const SizedBox(height: 50),
                const CustomKeyboard(),
              ],
            );
          }
          if (state is WordleSolved) {
            return Center(
              child: Text(
                'Congrats, you won!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }

  Container _buildBoard(WordleLoaded state) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 400,
      width: 300,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          // Get all the letters in a word.
          List<Letter?> letters = state.guesses[(index / 5).floor()].letters;
          // Count the number of letters in the selected word.
          int letterCount =
              letters.where((letter) => letter != null).toList().length;
          // For each letter, get the index (the position in the word).
          int letterIndex = index % 5;

          return CustomBoardTile(
            letters: letters,
            letterCount: letterCount,
            letterIndex: letterIndex,
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Another Word Game',
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
