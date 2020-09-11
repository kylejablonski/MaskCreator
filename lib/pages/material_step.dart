import 'package:flutter/material.dart';
import 'package:mask_creator/models/material_step_model.dart';
import 'package:mask_creator/widgets/list_divider.dart';
import 'package:mask_creator/widgets/material_item.dart';
import 'package:mask_creator/widgets/confirmation_dialog.dart';
import 'package:mask_creator/widgets/next_button.dart';
import 'package:mask_creator/widgets/previous_button.dart';

class MaterialSelection extends StatelessWidget {
  final String routeName;
  final MaskMaterial model;
  MaterialSelection({@required this.routeName, @required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a material"),
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => ListDivider(),
                itemCount: model.materials.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: MaterialListItem(item: model.materials[index]),
                    onTap: () {
                      // set the selected
                      model.setSelected(index);
                    },
                  );
                },
              ),
            ),
            _buildButtonBar(context, model),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonBar(BuildContext context, MaskMaterial model) {
    return Row(
      children: <Widget>[
        PreviousButton(text: 'Back'),
        NextButton(
          text: "Continue",
          enabled: true,
          nextAction: () {
            showDialog(
              context: context,
              child: ConfirmationDialog(
                model: model,
                routeName: routeName,
              ),
            );
          },
        ),
      ],
    );
  }
}
