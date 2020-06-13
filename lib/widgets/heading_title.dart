import 'package:flutter/material.dart';

class HeadingTitle extends StatelessWidget {
  final String text;

  HeadingTitle({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
