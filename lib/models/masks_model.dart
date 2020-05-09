import 'package:mask_creator/models/color_step_model.dart';
import 'package:mask_creator/models/material_step_model.dart';
import 'package:mask_creator/models/size_step_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MasksModel extends Model {
  List<Mask> masks = List<Mask>();
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
    masks.add(Mask(maskName, this.maskSize, this.mColor, this.sColor, this.maskMaterial));
    
    // notify listeners of this model
    notifyListeners();
  }
}

class Mask {
  final String maskName;
  final SizeItem maskSize;
  final MaterialItem maskMaterial;
  final ColorItem mColor;
  final ColorItem sColor;

  Mask(this.maskName, this.maskSize, this.mColor, this.sColor, this.maskMaterial);

  get size => maskSize;

  get material => maskMaterial;

  get maskColor => mColor;

  get strapColor => sColor;
}
