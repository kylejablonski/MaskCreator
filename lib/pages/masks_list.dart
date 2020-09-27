import 'package:flutter/material.dart';
import 'package:mask_creator/models/masks_model.dart';
import 'package:mask_creator/widgets/list_divider.dart';
import 'package:mask_creator/widgets/mask_list_item.dart';
import '../models/masks_model.dart';

class MasksList extends StatelessWidget {
  final String routeName;
  final Masks model;
  MasksList({@required this.routeName, @required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mask Creator'),
      ),
      body: Builder(builder: (context) {
        if (model.masks.length == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have not created any masks'),
              ],
            ),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => ListDivider(),
            itemCount: model.masks.length,
            itemBuilder: (context, index) {
              return MaskListItem(item: model.masks[index]);
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        tooltip: 'Create a mask',
        child: Icon(Icons.add),
      ),
    );
  }
}
