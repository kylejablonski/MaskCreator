import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SizeStepModel extends Model {
  var maskSizes = List<SizeItem>();
  int selected = -1;

  SizeStepModel() {
    maskSizes.add(SizeItem(Icons.person, "Adult", "8 inch mask"));
    maskSizes.add(SizeItem(Icons.person, "Teen", "7 inch mask"));
    maskSizes.add(SizeItem(Icons.person, "Child", "6 inch mask"));
  }

  void setSelected(int index) {
    // unselect the selected
    if (selected != -1) {
      maskSizes[selected].isSelected = false;
    }

    if (index != selected) {
      // set the new selected
      selected = index;
      maskSizes[selected].isSelected = true;
    } else {
      selected = -1;
    }

    notifyListeners();
  }
}

class SizeItem {
  IconData sizeIcon;
  String sizeName;
  String sizeDescription;
  bool isSelected = false;
  SizeItem(this.sizeIcon, this.sizeName, this.sizeDescription);

  setSelected(bool isSelected) {
    this.isSelected = isSelected;
  }

  get icon {
    return sizeIcon;
  }

  get name {
    return sizeName;
  }

  get description {
    return sizeDescription;
  }

  get selected {
    return isSelected;
  }
}
