import 'package:flutter/material.dart';

class LampSwitchRope extends StatefulWidget {
  final double screenWidth,screenHeight;
  final Color color;
  final Color onColor;
  final Color offColor;
  final bool isSwitchOn;
  final Function handle;
  LampSwitchRope({@required this.screenHeight,@required this.screenWidth, @required this.color, @required  this.isSwitchOn, @required this.onColor, @required this.offColor, this.handle});

  @override
  _LampSwitchRopeState createState() => _LampSwitchRopeState();
}

class _LampSwitchRopeState extends State<LampSwitchRope> {

  double _width = 40;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.screenWidth * 0.45,
      top: widget.screenHeight * 0.35,
      child: GestureDetector(
        onTap: (){
          widget.handle();
        },
        onVerticalDragUpdate:(v){
          if(v.delta.dy > 0){
            setState(() {
              _width = 80;
            });
          }
        },
        onVerticalDragEnd:(v){
            setState(() {
              _width = 40;
            });
            widget.handle();
        },
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _width,
              width:3,
              color: Colors.grey,
            ),
            Container(
              height: 15,
              width:15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            )
          ],
        ),
      )
    );
  }
}

