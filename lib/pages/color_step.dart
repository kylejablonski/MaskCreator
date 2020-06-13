import 'package:flutter/material.dart';
import 'package:mask_creator/models/color_step_model.dart';
import 'package:mask_creator/models/masks_model.dart';
import 'package:mask_creator/widgets/color.dart';
import 'package:mask_creator/widgets/heading_title.dart';
import 'package:mask_creator/widgets/next_button.dart';
import 'package:mask_creator/widgets/previous_button.dart';
import 'package:scoped_model/scoped_model.dart';

class ColorSelection extends StatelessWidget {
  final String routeName;
  ColorSelection({@required this.routeName});

  @override
  Widget build(BuildContext context) {
    // ColorStepModel
    return ScopedModel<MaskColor>(
      model: MaskColor(),
      // Children access the ColorStepModel
      child: ScopedModelDescendant<MaskColor>(builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Choose a color"),
          ),
          body: SafeArea(
            bottom: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                createMaskColorSection('Masks', model),
                createStrapColorSection('Straps', model),
                Spacer(),
                Row(
                  children: <Widget>[
                    PreviousButton(text: 'Back'),
                    NextButton(
                        text: 'Continue',
                        enabled: model.selectedMaskColor != -1 &&
                            model.selectedStrapColor != -1,
                        nextAction: () {
                          var homeModel = ScopedModel.of<Masks>(context);
                          homeModel.mColor =
                              model.maskColors[model.selectedMaskColor];
                          homeModel.sColor =
                              model.strapColors[model.selectedStrapColor];
                          Navigator.pushNamed(context, routeName);
                        }),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget createMaskColorSection(String title, MaskColor model) {
    return Column(
      children: <Widget>[
        HeadingTitle(text: title),
        GridView.count(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          crossAxisSpacing: 22,
          mainAxisSpacing: 22,
          shrinkWrap: true,
          crossAxisCount: 4,
          children: List.generate(
            model.maskColors.length,
            (index) {
              return InkWell(
                child: Center(
                  child: ColorTile(
                    color: model.maskColors[index].color,
                    isSelected: index == model.selectedMaskColor,
                  ),
                ),
                onTap: () {
                  model.setSelectedMaskColor(index);
                },
              );
            },
          ),
        )
      ],
    );
  }

  Widget createStrapColorSection(String title, MaskColor model) {
    return Column(
      children: <Widget>[
        HeadingTitle(text: 'Straps'),
        GridView.count(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          crossAxisSpacing: 22,
          mainAxisSpacing: 22,
          shrinkWrap: true,
          crossAxisCount: 4,
          children: List.generate(
            model.strapColors.length,
            (index) {
              return InkWell(
                child: Center(
                  child: ColorTile(
                    color: model.strapColors[index].color,
                    isSelected: index == model.selectedStrapColor,
                  ),
                ),
                onTap: () {
                  model.setSelectedStrapColor(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
