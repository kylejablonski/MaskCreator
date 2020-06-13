import 'package:flutter/material.dart';
import 'package:mask_creator/data/mask_item.dart';

class MaskListItem extends StatelessWidget {
  final MaskItem item;
  MaskListItem({@required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: _buildMaskListItem(context)),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMaskListItem(BuildContext context) {
    return <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildMaskText(item),
      ),
      Spacer(),
      Container(
        width: 65,
        height: 53,
        child: Stack(
          children: <Widget>[
            item.maskColor.image,
            Positioned(
              left: 49,
              top: 7,
              child: item.strapColor.image,
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildMaskText(item) {
    return <Widget>[
      Text(
        "${item.name}",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        "${item.material.name} ${item.size.name} (${item.size.description})",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        "${item.maskColor.name} w/ ${item.strapColor.name} straps",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ];
  }
}
