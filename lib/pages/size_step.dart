import 'package:flutter/material.dart';
import 'package:mask_creator/models/masks_model.dart';
import 'package:mask_creator/models/size_step_model.dart';
import 'package:mask_creator/widgets/list_divider.dart';
import 'package:mask_creator/widgets/next_button.dart';
import 'package:mask_creator/widgets/previous_button.dart';
import 'package:mask_creator/widgets/size_item.dart';
import 'package:scoped_model/scoped_model.dart';

class SizeSelection extends StatelessWidget {
  final String routeName;
  SizeSelection({@required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MaskSize>(
      model: MaskSize(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Choose a size"),
        ),
        body: ScopedModelDescendant<MaskSize>(builder: (context, child, model) {
          return SafeArea(
            bottom: true,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => ListDivider(),
                    itemCount: model.maskSizes.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: SizeListItem(item: model.maskSizes[index]),
                        onTap: () {
                          model.setSelected(index);
                        },
                      );
                    },
                  ),
                ),
                _buildButtonBar(context, model)
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildButtonBar(BuildContext context, MaskSize model) {
    return Row(
      children: <Widget>[
        PreviousButton(text: 'Cancel'),
        NextButton(
            text: 'Continue',
            enabled: model.selected != -1, // 1
            nextAction: () {
              var homeModel = ScopedModel.of<Masks>(context); // 2
              homeModel.size = model.maskSizes[model.selected]; // 3
              Navigator.pushNamed(context, this.routeName);
            }),
      ],
    );
  }
}
