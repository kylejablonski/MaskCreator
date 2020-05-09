import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  final String text;
  PreviousButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          borderSide: BorderSide(
            width: 1.0,
            color: Theme.of(context).accentColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child:Text(
            text,
            style: TextStyle(
              fontFamily: 'Baloo',
              fontWeight: FontWeight.w700,
              color: Theme.of(context).accentColor,
              fontSize: 18,
            ),
          ),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
