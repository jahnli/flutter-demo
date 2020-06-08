import 'package:flutter/material.dart';
import 'package:flutter_demo/smart_home/lamp_switch_rope.dart';
import 'lamp.dart';
import 'lamp_hanger_rope.dart';
import 'led_bulb.dart';

class SmartHome extends StatefulWidget {
  @override
  _SmartHomeState createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> {

  Color darkGray = Color(0xff232323);
  Color bulbOnColor = Color(0xffffe12c);
  Color bulbOffColor = Color(0xffc1c1c1);
  Gradient gradient = LinearGradient(colors: [Color(0xfffdf3b0).withOpacity(.5),Color(0xffffffed).withOpacity(.5)],begin: Alignment.topCenter,end: Alignment.bottomCenter);
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body:Stack(
        children: [
          LampHangerRope(screenHeight: _screenHeight, screenWidth: _screenWidth,color:darkGray),
          LedBulb(
            screenHeight: _screenHeight,
             screenWidth: _screenWidth,
             color:darkGray,
             isSwitchOn:_isSwitchOn,
             onColor:bulbOnColor,
             offColor:bulbOffColor
          ),
          Lamp(screenHeight: _screenHeight, screenWidth: _screenWidth,color:darkGray,isSwitchOn:_isSwitchOn,gradient:gradient),
          LampSwitchRope(
            screenHeight: _screenHeight,
             screenWidth: _screenWidth,
             color:darkGray,
             isSwitchOn:_isSwitchOn,
             onColor:bulbOnColor,
             offColor:bulbOffColor,
             handle:()=>handle()
          ),
        ],
      )
    );
  }

  void handle(){
    setState(() {
      _isSwitchOn = !_isSwitchOn;
    });
  }

}