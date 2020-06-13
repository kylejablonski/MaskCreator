import 'package:flutter/material.dart';

class CircularCheck extends StatelessWidget {
  final bool isSelected;
  final double contPaddingLeft;
  final double contPaddingTop;
  final double contPaddingRight;
  final double contPaddingBottom;
  final double iconPadding;

  CircularCheck(
      {@required this.isSelected,
      @required this.iconPadding,
      @required this.contPaddingLeft,
      @required this.contPaddingTop,
      @required this.contPaddingRight,
      @required this.contPaddingBottom});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isSelected,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          contPaddingLeft,
          contPaddingTop,
          contPaddingRight,
          contPaddingBottom,
        ),
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(iconPadding),
            child: Icon(
              Icons.check,
              size: 24,
            ),
          ),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
