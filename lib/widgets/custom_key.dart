import 'package:flutter/material.dart';

class CustomKey extends StatelessWidget {
  const CustomKey({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: 35,
      height: 35,
      margin: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
