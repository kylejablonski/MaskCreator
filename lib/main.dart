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

  @override
  Widget build(BuildContext context) {
    return ScopedModel<Masks>(
      model: Masks(),
      child: MaterialApp(
        title: 'Mask Creator',
        routes: {
          '/': (context) => MasksList(),
          '/size': (context) => SizeSelection(routeName: '/color'),
          '/color': (context) => ColorSelection(routeName: '/material'),
          '/material': (context) => MaterialSelection(routeName: '/'),
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
      ),
    );
  }
}
