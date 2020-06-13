import 'package:flutter/material.dart';

class SizeItem {
  IconData icon;
  String name;
  String description;
  bool _isSelected = false;
  SizeItem(
      {@required this.icon, @required this.name, @required this.description});

  setSelected(bool isSelected) {
    _isSelected = isSelected;
  }

  get selected => _isSelected;
}
