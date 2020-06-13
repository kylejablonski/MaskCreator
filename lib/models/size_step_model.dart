import 'package:flutter/material.dart';
import 'package:mask_creator/data/size_item.dart';
import 'package:scoped_model/scoped_model.dart';

class MaskSize extends Model {
  var maskSizes = List<SizeItem>();
  int selected = -1;

  MaskSize() {
    maskSizes.add(
      SizeItem(
        icon: Icons.person,
        name: "Adult",
        description: "8 inch mask",
      ),
    );
    maskSizes.add(
      SizeItem(
        icon: Icons.person,
        name: "Teen",
        description: "7 inch mask",
      ),
    );
    maskSizes.add(
      SizeItem(
        icon: Icons.person,
        name: "Child",
        description: "6 inch mask",
      ),
    );
  }

  void setSelected(int index) {
    // unselect the selected
    if (selected != -1) {
      maskSizes[selected].setSelected(false);
    }

    if (index != selected) {
      // set the new selected
      selected = index;
      maskSizes[selected].setSelected(true);
    } else {
      selected = -1;
    }

    notifyListeners();
  }
}
