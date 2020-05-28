import 'dart:math';
import 'package:flutter/material.dart';
class RedDot extends StatefulWidget {
  Offset _startPosition;
  Offset _endPosition;
  RedDot(this._startPosition,this._endPosition);
  @override
  _RedDotState createState() => _RedDotState();
}

class _RedDotState extends State<RedDot> with SingleTickerProviderStateMixin{
  Animation  _animation;
  AnimationController _animationController;
  double _left;
  double _top;

  @override
  void initState() {
    super.initState();
    print('子组件:${widget._startPosition} ${widget._startPosition}');

    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0,end: 1.0).animate(_animationController);

    double _controllerX = widget._startPosition.dx - 200;
    double _controllerY = widget._startPosition.dy  - 100;
    double _endX = widget._endPosition.dx + 6;
    double _endY = widget._endPosition.dy - 3;

    _animation.addListener(() {
      if(mounted){
        double t = _animation.value;
        setState(() {
          _left = pow(1 - t,2) * widget._startPosition.dx +  2 * t * (1 - t) * _controllerX +  pow(t,2) * _endX;
          _top = pow(1 - t,2) * widget._startPosition.dy +  2 * t * (1 - t) * _controllerY +  pow(t,2) * _endY;
        });
      }
    });
    // 显示小圆点的时候动画就开始
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: _left,
          top: _top,
          child: ClipOval(
            child: Container(
              width: 12,
              height: 12,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}