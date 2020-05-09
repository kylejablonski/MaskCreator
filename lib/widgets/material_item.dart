import 'package:flutter/material.dart';
import 'package:mask_creator/models/material_step_model.dart';
import 'package:mask_creator/widgets/circular_check.dart';

class MaterialListItem extends StatefulWidget {
  final MaterialItem materialItem;
  MaterialListItem(this.materialItem);
  @override
  State<StatefulWidget> createState() {
    return _MaterialListItemState();
  }
}

class _MaterialListItemState extends State<MaterialListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  widget.materialItem.materialName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Spacer(),
              CircularCheck(widget.materialItem.isSelected, 8, 0, 4, 16, 4),
            ],
          )
        ],
      ),
    );
  }
}
