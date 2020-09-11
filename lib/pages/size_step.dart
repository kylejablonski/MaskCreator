import 'package:flutter/material.dart';
import 'package:mask_creator/models/size_step_model.dart';
import 'package:mask_creator/widgets/list_divider.dart';
import 'package:mask_creator/widgets/next_button.dart';
import 'package:mask_creator/widgets/previous_button.dart';
import 'package:mask_creator/widgets/size_item.dart';

class SizeSelection extends StatelessWidget {
  final String routeName;
  final MaskSize model;
  SizeSelection({@required this.routeName, @required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose a size"),
        ),
        body: SafeArea(
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
        ));
  }

  Widget _buildButtonBar(BuildContext context, MaskSize model) {
    return Row(
      children: <Widget>[
        PreviousButton(text: 'Cancel'),
        NextButton(
            text: 'Continue',
            enabled: true,
            nextAction: () {
              Navigator.pushNamed(context, routeName);
            }),
      ],
    );
  }
}
