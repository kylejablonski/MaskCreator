import 'package:flutter/material.dart';
import 'package:mask_creator/models/size_step_model.dart';
import 'package:mask_creator/widgets/circular_check.dart';

class SizeListItem extends StatefulWidget {
  final SizeItem item;
  SizeListItem(this.item);
  @override
  State<StatefulWidget> createState() {
    return _SizeListItemState();
  }
}

class _SizeListItemState extends State<SizeListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            widget.item.icon,
            size: 48,
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Text(
                      widget.item.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Text(
                      widget.item.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          CircularCheck(widget.item.selected, 8, 0, 8, 16, 8),
        ],
      ),
    );
  }
}
