import 'package:flutter/material.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBoard(),
          const SizedBox(height: 50),
          const CustomKeyboard(),
        ],
      ),
    );
  }

  Container _buildBoard() {
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
          return const CustomBoardTile();
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
