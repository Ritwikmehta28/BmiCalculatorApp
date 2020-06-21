import 'package:bmicalculators/constants.dart';
import 'package:flutter/material.dart';

class ColumnGender extends StatelessWidget {
  ColumnGender({@required this.gender, @required this.iconic});

  final IconData iconic;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconic,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
