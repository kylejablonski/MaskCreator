import 'package:flutter/material.dart';

class ColorTiledChecked extends StatelessWidget {
  final Color color;

  ColorTiledChecked({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildColorSquare(color),
        _buildCheckMarkBackground(),
        _buildCheckMark(),
      ],
    );
  }

  Widget _buildColorSquare(Color color) {
    return Container(
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildCheckMarkBackground() {
    return Container(
      decoration: new BoxDecoration(
        color: Color.fromARGB(150, 255, 255, 255),
        shape: BoxShape.rectangle,
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildCheckMark() {
    return Center(
      child: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.0,
            color: Colors.black,
          ),
        ),
        child: Icon(
          Icons.check,
          color: Colors.black,
          size: 48,
        ),
      ),
    );
  }
}
