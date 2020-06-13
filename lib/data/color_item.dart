import 'package:flutter/material.dart';

class ColorItem {
  final String name;
  final Color color;
  final Widget image;
  bool _isSelected = false;
  ColorItem({@required this.name, @required this.color, @required this.image});

  get selected => _isSelected;

  setSelected(bool isSelected) {
    _isSelected = isSelected;
  }
}
