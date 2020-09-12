import 'package:mask_creator/data/material_item.dart';
import 'package:scoped_model/scoped_model.dart';

class MaskMaterial extends Model {
  var materials = List<MaterialItem>();
  int selected = -1;

  MaskMaterial() {
    materials.add(MaterialItem(name: 'Cotton'));
    materials.add(MaterialItem(name: 'Polyester'));
    materials.add(MaterialItem(name: 'Silk'));
    materials.add(MaterialItem(name: 'Leather'));
    materials.add(MaterialItem(name: 'Carbon Fiber'));
  }

  void setSelected(int index) {
    // unselect the selected
    if (selected != -1) {
      materials[selected].setSelected(false);
    }

    if (index != selected) {
      // set the new selected
      selected = index;
      materials[selected].setSelected(true);
    } else {
      selected = -1;
    }
    notifyListeners();
  }
}
