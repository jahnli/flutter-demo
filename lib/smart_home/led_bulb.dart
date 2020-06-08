import 'package:flutter/material.dart';
class LedBulb extends StatelessWidget {
  final double screenWidth,screenHeight;
  final Color color;
  final Color onColor;
  final Color offColor;
  final bool isSwitchOn;

  LedBulb({@required this.screenHeight,@required this.screenWidth, @required this.color, @required  this.isSwitchOn, @required this.onColor, @required this.offColor});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth *.18,
      height: screenHeight * .7,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape:BoxShape.circle,
          color: isSwitchOn ? onColor:offColor 
        ),
      ),
    );
  }
}