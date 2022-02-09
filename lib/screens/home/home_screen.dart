import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle/models/models.dart';
import '/blocs/blocs.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WORDLE'),
      ),
      body: BlocBuilder<WordleBloc, WordleState>(
        builder: (context, state) {
          if (state is WordleLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WordleLoaded) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 400,
                    width: 300,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                      ),
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        List<Letter?> letters =
                            state.guesses[(index / 5).floor()].letters;

                        int letterCount = letters
                            .where((letter) => letter != null)
                            .toList()
                            .length;

                        int wordIndex = index % 5;
                        return Container(
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: (letterCount > wordIndex)
                                ? Text(letters[wordIndex]!.letter)
                                : const Text(''),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: state.Wordle.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Text(state.Wordle[index]);
                  //   },
                  // ),
                  const CustomKeyboard(),
                ],
              ),
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }
}
