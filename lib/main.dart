import 'package:flutter/material.dart';
import 'package:mask_creator/models/color_step_model.dart';
import 'package:mask_creator/models/masks_model.dart';
import 'package:mask_creator/models/material_step_model.dart';
import 'package:mask_creator/models/size_step_model.dart';
import 'package:mask_creator/pages/color_step.dart';
import 'package:mask_creator/pages/masks_list.dart';
import 'package:mask_creator/pages/material_step.dart';
import 'package:mask_creator/pages/size_step.dart';
import 'models/masks_model.dart';
import 'pages/masks_list.dart';

void main() => runApp(MyApp(model: Masks()));

class MyApp extends StatelessWidget {
  final Masks model;
  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mask Creator',
      routes: {
        '/': (context) => MasksList(model: this.model),
        '/size': (context) =>
            SizeSelection(routeName: '/color', model: MaskSize()),
        '/color': (context) =>
            ColorSelection(routeName: '/material', model: MaskColor()),
        '/material': (context) =>
            MaterialSelection(routeName: '/', model: MaskMaterial()),
      },
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.red,
        fontFamily: 'Baloo',
        primaryIconTheme: IconThemeData(),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
