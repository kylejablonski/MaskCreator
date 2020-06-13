import 'package:flutter/material.dart';
import 'package:mask_creator/widgets/color_checked.dart';

class ColorTile extends StatelessWidget {
  final Color color;
  final bool isSelected;
  ColorTile({@required this.color, @required this.isSelected});

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return ColorTiledChecked(
        color: color,
      );
    } else {
      return getContainer();
    }
  }

  Widget getContainer() {
    return Stack(
      children: <Widget>[
        Container(
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
        ),
      ],
    );
  }
}
