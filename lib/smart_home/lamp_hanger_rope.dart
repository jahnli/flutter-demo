import 'package:flutter/material.dart';

class LampHangerRope extends StatelessWidget {

  final double screenWidth,screenHeight;
  final Color color;
  LampHangerRope({@required this.screenHeight,@required this.screenWidth, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth * 0.2,
      child: Container(
        color: color,
        width: 15,
        height: screenHeight * 0.15,
      ),
    );
  }
}