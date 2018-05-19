import 'package:flutter/material.dart';

class StartAnimation extends StatefulWidget {
  StartAnimation({Key key, this.buttonController})
      : shrinkButtonAnimation =
            new Tween(begin: 320.0, end: 70.0).animate(buttonController),
        super(key: key);

  final AnimationController buttonController;
  final Animation shrinkButtonAnimation;

  Widget _builtAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: new Container(
          alignment: FractionalOffset.center,
          width: shrinkButtonAnimation.value,
          height: 60.0,
          decoration: BoxDecoration(
              color: Colors.red[700],
              borderRadius: BorderRadius.all(const Radius.circular(30.0))),
          child: shrinkButtonAnimation.value > 75
              ? Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.3),
                )
              : CircularProgressIndicator(
                  strokeWidth: 1.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                ),)
    );
  }

  @override
  _StartAnimationState createState() => new _StartAnimationState();
}

class _StartAnimationState extends State<StartAnimation> {
  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      builder: widget._builtAnimation,
      animation: widget.buttonController,
    );
  }
}
