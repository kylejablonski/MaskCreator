import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ColorStepModel extends Model {
  List maskColors = List<ColorItem>();
  List strapColors = List<ColorItem>();
  int selectedMaskColor = -1;
  int selectedStrapColor = -1;

  static const _mask_colors = {
    "Red": Colors.red,
    "Pink": Colors.pink,
    "Purple": Colors.purple,
    "Dark Purple": Colors.deepPurple,
    "Indigo": Colors.indigo,
    "Blue": Colors.blue,
    "Teal": Colors.teal,
    "Green": Colors.green,
    "Yellow": Colors.yellow,
    "Orange": Colors.orange,
    "Brown": Colors.brown,
    "Black": Colors.black
  };

  static const _mask_icons = {
    "Red": const Image(
      image: AssetImage('assets/masks/red_mask.png'),
      width: 52,
      height: 52,
    ),
    "Pink": const Image(
      image: AssetImage('assets/masks/pink_mask.png'),
      width: 52,
      height: 52,
    ),
    "Purple": const Image(
      image: AssetImage('assets/masks/purple_mask.png'),
      width: 52,
      height: 52,
    ),
    "Dark Purple": const Image(
      image: AssetImage('assets/masks/deep_purple_mask.png'),
      width: 52,
      height: 52,
    ),
    "Indigo": const Image(
      image: AssetImage('assets/masks/indigo_mask.png'),
      width: 52,
      height: 52,
    ),
    "Blue": const Image(
      image: AssetImage('assets/masks/blue_mask.png'),
      width: 52,
      height: 52,
    ),
    "Teal": const Image(
      image: AssetImage('assets/masks/teal_mask.png'),
      width: 52,
      height: 52,
    ),
    "Green": const Image(
      image: AssetImage('assets/masks/green_mask.png'),
      width: 52,
      height: 52,
    ),
    "Yellow": const Image(
      image: AssetImage('assets/masks/yellow_mask.png'),
      width: 52,
      height: 52,
    ),
    "Orange": const Image(
      image: AssetImage('assets/masks/orange_mask.png'),
      width: 52,
      height: 52,
    ),
    "Brown": const Image(
      image: AssetImage('assets/masks/brown_mask.png'),
      width: 52,
      height: 52,
    ),
    "Black": const Image(
      image: AssetImage('assets/masks/black_mask.png'),
      width: 52,
      height: 52,
    ),
  };

  static const _strap_colors = {
    "Black": Colors.black,
    "White": Colors.white,
    "Grey": Colors.grey,
    "Graphite": Color(0xFF303030)
  };

  static const _strap_icons = {
    "Black": const Image(
      image: AssetImage('assets/straps/black_strap.png'),
      height: 24,
      width: 14,
    ),
    "White": const Image(
      image: AssetImage('assets/straps/white_strap.png'),
      height: 24,
      width: 14,
    ),
    "Grey": const Image(
      image: AssetImage('assets/straps/grey_strap.png'),
      height: 24,
      width: 14,
    ),
    "Graphite": const Image(
      image: AssetImage('assets/straps/graphite_strap.png'),
      height: 24,
      width: 14,
    ),
  };

  ColorStepModel() {
    _createMaskColors();
    _createStrapColors();
  }

  void _createMaskColors() {
    _mask_colors
        .forEach((k, v) => maskColors.add(ColorItem(k, v, _mask_icons[k])));
  }

  void _createStrapColors() {
    _strap_colors
        .forEach((k, v) => strapColors.add(ColorItem(k, v, _strap_icons[k])));
  }

  void setSelectedMaskColor(int maskColorIndex) {
    // unselect the selected
    if (selectedMaskColor != -1) {
      maskColors[selectedMaskColor].isSelected = false;
    }

    if (maskColorIndex != selectedMaskColor) {
      // set the new selected
      selectedMaskColor = maskColorIndex;
      maskColors[selectedMaskColor].isSelected = true;
    } else {
      selectedMaskColor = -1;
    }

    notifyListeners();
  }

  void setSelectedStrapColor(int strapColorIndex) {
    // unselect the selected
    if (selectedStrapColor != -1) {
      strapColors[selectedStrapColor].isSelected = false;
    }

    if (strapColorIndex != selectedStrapColor) {
      // set the new selected
      selectedStrapColor = strapColorIndex;
      strapColors[selectedStrapColor].isSelected = true;
    } else {
      selectedStrapColor = -1;
    }

    notifyListeners();
  }
}

class ColorItem {
  final String name;
  final Color color;
  final Widget image;
  bool isSelected = false;
  ColorItem(this.name, this.color, this.image);

  setSelected(bool isSelected) {
    this.isSelected = isSelected;
  }
}
