import 'package:flutter/material.dart';

class CustomProgress extends StatefulWidget {

  final double progress;
  final double screenWidth;
  CustomProgress({this.progress = 1.0,this.screenWidth});
  
  @override
  _CustomProgressState createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _animation = Tween(begin: 0,end: widget.screenWidth * .3 * widget.progress).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * .3;
    return  AnimatedBuilder(
      animation: _animation,
      builder: (context,child){
        return Container(
          height: 8,
          child: Stack(
            children: <Widget>[
              Container(
                width: _width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: .5,
                    color: Colors.grey
                  )
                ),
              ),
              Positioned(
                child: Container(
                  width: double.parse(_animation.value.toString()),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient:LinearGradient(colors: [Colors.red[200],Colors.red[400]])
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
