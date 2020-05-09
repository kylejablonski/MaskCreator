import 'package:flutter/material.dart';
import 'package:mask_creator/models/masks_model.dart';
import 'package:mask_creator/models/size_step_model.dart';
import 'package:mask_creator/widgets/list_divider.dart';
import 'package:mask_creator/widgets/next_button.dart';
import 'package:mask_creator/widgets/previous_button.dart';
import 'package:mask_creator/widgets/size_item.dart';
import 'package:scoped_model/scoped_model.dart';

class SizeStep extends StatelessWidget {
  final String nextPage;
  SizeStep(this.nextPage);
  @override
  Widget build(BuildContext context) {
    return ScopedModel<SizeStepModel>(
      model: SizeStepModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Choose a size"),
        ),
        body: ScopedModelDescendant<SizeStepModel>(
            builder: (context, child, model) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => ListDivider(),
                  itemCount: model.maskSizes.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: SizeListItem(model.maskSizes[index]),
                      onTap: () {
                        model.setSelected(index);
                      },
                    );
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  PreviousButton('Cancel'),
                  NextButton('Continue', model.selected != -1, () {
                    var homeModel = ScopedModel.of<MasksModel>(context);
                    homeModel.size = model.maskSizes[model.selected];
                    Navigator.pushNamed(context, nextPage);
                  }),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
