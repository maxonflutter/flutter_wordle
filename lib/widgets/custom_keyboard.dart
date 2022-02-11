import 'package:flutter/material.dart';
import '/widgets/custom_key.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> firstRow = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
    List<String> secondRow = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
    List<String> thirdRow = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...firstRow.map(
              (letter) => CustomKey(
                text: letter,
                // evaluation: letters,
                onTap: () {},
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...secondRow.map(
              (letter) => CustomKey(
                text: letter,
                // evaluation: letters,
                onTap: () {},
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...thirdRow.map(
              (letter) => CustomKey(
                text: letter,
                // evaluation: letters,
                onTap: () {},
              ),
            ),
            Container(
              width: 90,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.secondary,
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              margin: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {},
                child: Center(
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
