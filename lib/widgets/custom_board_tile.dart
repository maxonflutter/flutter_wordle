import 'package:flutter/material.dart';

class CustomBoardTile extends StatelessWidget {
  const CustomBoardTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
      ),
      child: const Center(
        child: Text(''),
      ),
    );
  }
}
