import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final Function nextAction;
  NextButton(
      {@required this.text, @required this.enabled, @required this.nextAction});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          color: Theme.of(context).accentColor,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Baloo',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          onPressed: handlePress(context),
        ),
      ),
    );
  }

  Function handlePress(context) {
    if (!enabled) {
      return null;
    } else {
      return nextAction;
    }
  }
}
