import 'package:flutter/material.dart';

class ButtonRegister extends StatelessWidget {
  final Function onPressed;
  final String labelText;
  final Decoration decoration;
  final Color textStyleColor;

  ButtonRegister({
    this.onPressed,
    this.labelText = '',
    this.decoration,
    this.textStyleColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: decoration,
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          labelText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textStyleColor, //ColorPalette.gradientNeonLife2,
              fontSize: 19),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class ButtonCommon extends StatelessWidget {
  final String labelText;
  final Function onPressed;

  ButtonCommon({
    this.labelText = '',
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
          highlightElevation: 0.0,
          splashColor: Colors.white,
          highlightColor: Colors.white,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            labelText,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
                fontSize: 18),
          ),
          onPressed: onPressed),
    );
  }
}
