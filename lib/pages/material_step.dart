import 'package:flutter/material.dart';
import 'package:mask_creator/models/material_step_model.dart';
import 'package:mask_creator/widgets/list_divider.dart';
import 'package:mask_creator/widgets/material_item.dart';
import 'package:mask_creator/widgets/confirmation_dialog.dart';
import 'package:mask_creator/widgets/next_button.dart';
import 'package:mask_creator/widgets/previous_button.dart';
import 'package:scoped_model/scoped_model.dart';

class MaterialStep extends StatelessWidget {
  final String nextPage;
  MaterialStep(this.nextPage);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MaterialStepModel>(
      model: MaterialStepModel(),
      child: ScopedModelDescendant<MaterialStepModel>(
          builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Choose a material"),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      ListDivider(),
                  itemCount: model.materials.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: MaterialListItem(model.materials[index]),
                      onTap: () {
                        // set the selected
                        model.setSelected(index);
                      },
                    );
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  PreviousButton('Back'),
                  NextButton(
                    "Continue",
                    model.selected != -1,
                    () {
                      showDialog(
                          context: context, child: ConfirmationDialog(model, nextPage));
                    },
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
