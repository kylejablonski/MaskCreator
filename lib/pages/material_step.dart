import 'package:flutter/material.dart';
import 'package:mask_creator/models/material_step_model.dart';
import 'package:mask_creator/widgets/list_divider.dart';
import 'package:mask_creator/widgets/material_item.dart';
import 'package:mask_creator/widgets/confirmation_dialog.dart';
import 'package:mask_creator/widgets/next_button.dart';
import 'package:mask_creator/widgets/previous_button.dart';
import 'package:scoped_model/scoped_model.dart';

class MaterialSelection extends StatelessWidget {
  final String routeName;
  MaterialSelection({@required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MaskMaterial>(
      model: MaskMaterial(),
      child:
          ScopedModelDescendant<MaskMaterial>(builder: (context, child, model) {
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
      }),
    );
  }

  Widget _buildButtonBar(BuildContext context, MaskMaterial model) {
    return Row(
      children: <Widget>[
        PreviousButton(text: 'Back'),
        NextButton(
          text: "Continue",
          enabled: model.selected != -1,
          nextAction: () {
            showDialog(
                context: context,
                child: ConfirmationDialog(
                  model: model,
                  routeName: routeName,
                ));
          },
        )
      ],
    );
  }
}
