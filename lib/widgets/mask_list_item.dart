import 'package:flutter/material.dart';
import 'package:mask_creator/models/masks_model.dart';

class MaskListItem extends StatelessWidget {
  final Mask mask;
  MaskListItem(this.mask);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${mask.maskName}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${mask.maskMaterial.materialName} ${mask.maskSize.name} (${mask.maskSize.description})",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${mask.mColor.name} w/ ${mask.sColor.name} straps",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 65,
                  height: 53,
                  child: Stack(
                    children: <Widget>[
                      mask.mColor.image,
                      Positioned(left: 49, top: 7, child: mask.sColor.image),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
