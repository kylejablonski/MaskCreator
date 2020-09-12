import 'package:mask_creator/data/color_item.dart';
import 'package:mask_creator/data/mask_item.dart';
import 'package:mask_creator/data/material_item.dart';
import 'package:mask_creator/data/size_item.dart';
import 'package:scoped_model/scoped_model.dart';

class Masks extends Model {
  List<MaskItem> masks = List<MaskItem>();
  SizeItem maskSize;
  MaterialItem maskMaterial;
  ColorItem mColor;
  ColorItem sColor;

  set size(SizeItem sizeItem) {
    this.maskSize = sizeItem;
  }

  set material(MaterialItem material) {
    this.maskMaterial = material;
  }

  set maskColor(ColorItem color) {
    this.mColor = color;
  }

  set strapColor(ColorItem color) {
    this.sColor = color;
  }

  void createNewMask(String maskName) {
    // add a Mask
    masks.add(MaskItem(
        name: maskName,
        size: this.maskSize,
        maskColor: this.mColor,
        strapColor: this.sColor,
        material: this.maskMaterial));

    notifyListeners();
  }
}
