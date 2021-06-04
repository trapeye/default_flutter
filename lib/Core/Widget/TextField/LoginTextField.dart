import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldNumberPhone extends StatelessWidget {
  final String labelText;
  final Function onChange;
  final Function onSubmit;
  final bool obscureText;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final Icon icon;
  final TextInputAction textInputAction;
  final bool autoFocus;
  final TextEditingController controller;
  final String errorText;
  final bool isThisError;

  TextFieldNumberPhone(
      {this.autoFocus = false,
      this.labelText = '',
      this.onChange,
      this.obscureText = false,
      this.textAlign = TextAlign.start,
      this.keyboardType = TextInputType.text,
      this.icon,
      this.onSubmit,
      this.textInputAction = TextInputAction.done,
      this.controller,
      this.errorText,
      this.isThisError = false});

  final _mobileFormatter = NumberTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autoFocus,
      textInputAction: textInputAction,
      onChanged: onChange,
      textAlign: textAlign,
      keyboardType: keyboardType,
      maxLength: 12,
      inputFormatters: [
        LengthLimitingTextInputFormatter(12),
        FilteringTextInputFormatter.digitsOnly,
        _mobileFormatter
      ],
      onSubmitted: onSubmit,
      /*style: TextStyle(
          color: ColorPalette.gradientNeonLife2, fontWeight: FontWeight.w500),*/
      decoration: InputDecoration(
        errorText: isThisError ? null : errorText,
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        counterText: '',
        hintText: '78 - 7888888',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(),
        prefixIcon: icon != null ? icon : null,
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final String labelText;
  final Function onChange;
  final Function onSubmit;
  final TextEditingController controller;
  final String errorText;
  final bool isThisError;
  final bool autoFocus;
  final TextInputAction textInputAction;
  TextFieldPassword({
    this.autoFocus = false,
    @required this.onSubmit,
    @required this.onChange,
    this.textInputAction = TextInputAction.done,
    @required this.labelText,
    @required this.controller,
    @required this.errorText,
    this.isThisError = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      controller: controller,
      obscureText: true,
      textInputAction: textInputAction,
      keyboardType: TextInputType.text,
      onChanged: onChange,
      onSubmitted: onSubmit,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        // FilteringTextInputFormatter.singleLineFormatter
      ],
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorText: isThisError ? null : errorText,
        prefixIcon: Icon(Icons.lock_outline),
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 2) + ' - ');
      if (newValue.selection.end >= 2) selectionIndex += 3;
    }

    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
