import 'package:flutter/material.dart';
import 'package:mask_creator/models/masks_model.dart';
import 'package:mask_creator/widgets/list_divider.dart';
import 'package:mask_creator/widgets/mask_list_item.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/masks_model.dart';

class MasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mask Creator'),
        ),
        body:
            ScopedModelDescendant<MasksModel>(builder: (context, child, model) {
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
              separatorBuilder: (BuildContext context, int index) => ListDivider(),
              itemCount: model.masks.length,
              itemBuilder: (context, index) {
                return MaskListItem(model.masks[index]);
              },
            );
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/size');
          },
          tooltip: 'Create a mask',
          child: Icon(Icons.add),
        ),
      
    );
  }
}

