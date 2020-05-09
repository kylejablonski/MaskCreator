import 'package:scoped_model/scoped_model.dart';

class MaterialStepModel extends Model {
  var materials = List<MaterialItem>();
  int selected = -1;

  MaterialStepModel() {
    materials.add(MaterialItem('Cotton'));
    materials.add(MaterialItem('Polyester'));
    materials.add(MaterialItem('Silk'));
    materials.add(MaterialItem('Leather'));
    materials.add(MaterialItem('Carbon Fiber'));
  }

  void setSelected(int index) {
    // unselect the selected
    if (selected != -1) {
      materials[selected].isSelected = false;
    }

    if (index != selected) {
      // set the new selected
      selected = index;
      materials[selected].isSelected = true;
    } else {
      selected = -1;
    }

    notifyListeners();
  }
}

class MaterialItem {
  String materialName;
  bool isSelected = false;
  MaterialItem(this.materialName);

  setSelected(bool isSelected) {
    this.isSelected = isSelected;
  }

  get name {
    return materialName;
  }

  get selected {
    return isSelected;
  }
}
