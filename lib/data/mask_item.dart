import 'package:flutter/material.dart';
import 'package:mask_creator/data/size_item.dart';

import 'color_item.dart';
import 'material_item.dart';

class MaskItem {
  final String name;
  final SizeItem size;
  final MaterialItem material;
  final ColorItem maskColor;
  final ColorItem strapColor;

  MaskItem(
      {@required this.name,
      @required this.size,
      @required this.maskColor,
      @required this.strapColor,
      @required this.material});
}
