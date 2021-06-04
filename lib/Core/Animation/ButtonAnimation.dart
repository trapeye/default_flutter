import 'package:flutter/material.dart';

enum ButtonState { idle, loading, fail, success }

class ButtonAnimation extends StatefulWidget {
  final double width;
  final double radius;
  final Color color;
  final ButtonState buttonState;
  final Widget widget;
  final VoidCallback onPressed;

  ButtonAnimation({
    @required this.onPressed,
    @required this.widget,
    @required this.radius,
    @required this.width,
    @required this.color,
    this.buttonState = ButtonState.idle,
  });

  @override
  _ButtonAnimationState createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation> {
  double width;
  double radius;
  Color color;
  VoidCallback onPressed;

  Widget _widget;

  void initState() {
    super.initState();

    width = widget.width;
    radius = widget.radius;
    _widget = widget.widget;
    color = widget.color;
    onPressed = widget.onPressed;
  }

  static Widget get fail {
    return Text(
      'Failed',
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }

  static Widget get success {
    return Text(
      'Success',
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }

  static Widget get circularLoading {
    return CircularProgressIndicator();
  }

  void startAnimations(ButtonState oldState, ButtonState newState) {
    switch (widget.buttonState) {
      case ButtonState.idle:
        {
          onPressed = widget.onPressed;
          _widget = widget.widget;
          radius = widget.radius;
          width = widget.width;
          color = widget.color;
        }
        break;
      case ButtonState.loading:
        {
          onPressed = null;
          _widget = circularLoading;
          //width = 60.0;
          //radius = 30;
        }
        break;
      case ButtonState.success:
        {
          radius = widget.radius;
          width = widget.width;
          _widget = success;
          color = Colors.lightGreen;
        }
        break;
      case ButtonState.fail:
        {
          radius = widget.radius;
          width = widget.width;
          _widget = fail;
          color = Colors.red;
        }
        break;
    }
  }

  @override
  void didUpdateWidget(covariant ButtonAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.buttonState != widget.buttonState) {
      startAnimations(oldWidget.buttonState, widget.buttonState);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onPressed,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(radius),
        child: AnimatedContainer(
          height: 50,
          width: width,
          duration: Duration(milliseconds: 700),
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color,
          ),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            switchInCurve: Curves.fastOutSlowIn,
            switchOutCurve: Curves.fastOutSlowIn,
            child: _widget,
          ),
        ),
      ),
    );
  }
}
