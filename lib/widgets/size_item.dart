import 'package:flutter/material.dart';
import 'package:mask_creator/data/size_item.dart';
import 'package:mask_creator/widgets/circular_check.dart';

class SizeListItem extends StatefulWidget {
  final SizeItem item;
  SizeListItem({@required this.item});
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
          Row(children: _buildSizeText()),
          Spacer(),
          CircularCheck(
            isSelected: widget.item.selected,
            iconPadding: 8,
            contPaddingLeft: 0,
            contPaddingTop: 8,
            contPaddingRight: 16,
            contPaddingBottom: 8,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSizeText() {
    return <Widget>[
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
    ];
  }
}
