import 'package:flutter/material.dart';
import 'package:mask_creator/models/color_step_model.dart';
import 'package:mask_creator/models/masks_model.dart';
import 'package:mask_creator/widgets/color.dart';
import 'package:mask_creator/widgets/heading_title.dart';
import 'package:mask_creator/widgets/next_button.dart';
import 'package:mask_creator/widgets/previous_button.dart';
import 'package:scoped_model/scoped_model.dart';

class ColorStep extends StatelessWidget {
  final String nextPage;
  ColorStep(this.nextPage);

  @override
  Widget build(BuildContext context) {
    // ColorStepModel
    return ScopedModel<ColorStepModel>(
      model: ColorStepModel(),
      // Children access the ColorStepModel
      child: ScopedModelDescendant<ColorStepModel>(
          builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Choose a color"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              createMaskColorSection('Masks', model),
              createStrapColorSection('Straps', model),
              Spacer(),
              Row(
                children: <Widget>[
                  PreviousButton('Back'),
                  NextButton(
                      'Continue',
                      model.selectedMaskColor != -1 &&
                          model.selectedStrapColor != -1, () {
                    var homeModel = ScopedModel.of<MasksModel>(context);
                    homeModel.mColor =
                        model.maskColors[model.selectedMaskColor];
                    homeModel.sColor =
                        model.strapColors[model.selectedStrapColor];
                    Navigator.pushNamed(context, nextPage);
                  }),
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  Widget createMaskColorSection(String title, ColorStepModel model) {
    return Column(
      children: <Widget>[
        HeadingTitle(title),
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
                    model.maskColors[index].color,
                    index == model.selectedMaskColor,
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

  Widget createStrapColorSection(String title, ColorStepModel model) {
    return Column(
      children: <Widget>[
        HeadingTitle('Straps'),
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
                    model.strapColors[index].color,
                    index == model.selectedStrapColor,
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
