import 'package:flutter/material.dart';
import 'package:mask_creator/models/masks_model.dart';
import 'package:mask_creator/pages/color_step.dart';
import 'package:mask_creator/pages/masks_list.dart';
import 'package:mask_creator/pages/material_step.dart';
import 'package:mask_creator/pages/size_step.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/masks_model.dart';
import 'pages/masks_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MasksModel>(
      model: MasksModel(),
      child: MaterialApp(
        title: 'Mask Creator',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => MasksList(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/size': (context) => SizeStep('/color'),
          '/color': (context) => ColorStep('/material'),
          '/material': (context) => MaterialStep('/'),
        },
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.red,
          fontFamily: 'Baloo',
          primaryIconTheme: IconThemeData(),
          primaryTextTheme: TextTheme(
            title: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
