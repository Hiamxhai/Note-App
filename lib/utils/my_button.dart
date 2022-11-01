import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPress;
   MyButton({
    Key? key,
    required this.text,
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPress,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
