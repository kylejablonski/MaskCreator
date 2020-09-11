import 'package:mask_creator/data/material_item.dart';

class MaskMaterial {
  var _materials = List<MaterialItem>();
  int selected = -1;

  List<MaterialItem> get materials {
    return _materials;
  }

  MaskMaterial() {
    _materials.add(MaterialItem(name: 'Cotton'));
    _materials.add(MaterialItem(name: 'Polyester'));
    _materials.add(MaterialItem(name: 'Silk'));
    _materials.add(MaterialItem(name: 'Leather'));
    _materials.add(MaterialItem(name: 'Carbon Fiber'));
  }

  void setSelected(int index) {
    // unselect the selected
    if (selected != -1) {
      _materials[selected].setSelected(false);
    }

    if (index != selected) {
      // set the new selected
      selected = index;
      _materials[selected].setSelected(true);
    } else {
      selected = -1;
    }
  }
}
