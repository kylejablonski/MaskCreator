import 'package:flutter/material.dart';
import 'package:mask_creator/models/color_step_model.dart';
import 'package:mask_creator/widgets/color.dart';
import 'package:mask_creator/widgets/heading_title.dart';
import 'package:mask_creator/widgets/next_button.dart';
import 'package:mask_creator/widgets/previous_button.dart';

class ColorSelection extends StatelessWidget {
  final String routeName;
  final MaskColor model;
  ColorSelection({@required this.routeName, @required this.model});

  @override
  Widget build(BuildContext context) {
    // ColorStepModel
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
                    enabled: true,
                    nextAction: () {
                      Navigator.pushNamed(context, routeName);
                    }),
              ],
            )
          ],
        ),
      ),
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
