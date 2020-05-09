import 'package:flutter/material.dart';
import 'package:mask_creator/models/masks_model.dart';
import 'package:mask_creator/models/material_step_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ConfirmationDialog extends StatefulWidget {
  final MaterialStepModel model;
  final String nextPage;
  ConfirmationDialog(this.model, this.nextPage);
  @override
  State<StatefulWidget> createState() {
    return _ConfirmationDialog();
  }
}

class _ConfirmationDialog extends State<ConfirmationDialog> {
  // of the TextField.
  final nameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            saveMask(context, widget.model);
          },
          child: Text(
            'Create',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
      title: Text(
        'Who is this mask for?',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Enter a name'),
          ),
        ],
      ),
    );
  }

  void saveMask(context, model) {
    // find the home model
    var homeModel = ScopedModel.of<MasksModel>(context);
    // set the material
    homeModel.material = model.materials[model.selected];
    // create the mask
    homeModel.createNewMask(nameController.text);
    // pop to the homepage
    Navigator.popUntil(context, ModalRoute.withName(widget.nextPage));
  }
}
