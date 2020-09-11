import 'package:flutter/material.dart';
import 'package:mask_creator/data/size_item.dart';

class MaskSize {
  var sizes = List<SizeItem>();
  int selected = -1;

  List<SizeItem> get maskSizes {
    return sizes;
  }

  MaskSize() {
    sizes.add(
      SizeItem(
        icon: Icons.person,
        name: "Adult",
        description: "8 inch mask",
      ),
    );
    sizes.add(
      SizeItem(
        icon: Icons.person,
        name: "Teen",
        description: "7 inch mask",
      ),
    );
    sizes.add(
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
      sizes[selected].setSelected(false);
    }

    if (index != selected) {
      // set the new selected
      selected = index;
      sizes[selected].setSelected(true);
    } else {
      selected = -1;
    }
  }
}
