import 'package:flutter/material.dart';
import 'package:mask_creator/data/material_item.dart';
import 'package:mask_creator/widgets/circular_check.dart';

class MaterialListItem extends StatefulWidget {
  final MaterialItem item;
  MaterialListItem({@required this.item});
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
                  widget.item.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Spacer(),
              CircularCheck(
                isSelected: widget.item.selected,
                iconPadding: 8,
                contPaddingLeft: 0,
                contPaddingTop: 4,
                contPaddingRight: 16,
                contPaddingBottom: 4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
