import 'package:flutter/material.dart';

class MaterialItem {
  String name;
  bool _isSelected = false;
  MaterialItem({@required this.name});

  get selected => _isSelected;

  setSelected(bool isSelected) {
    _isSelected = isSelected;
  }
}
