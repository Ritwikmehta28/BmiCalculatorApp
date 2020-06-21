import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonText, @required this.onTap});

  final Function onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kBigButton,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomButtonColour,
        height: kBottomButtonHeight,
        width: double.infinity,
      ),
    );
  }
}
