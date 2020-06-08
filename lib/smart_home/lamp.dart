import 'package:flutter/material.dart';

class Lamp extends StatelessWidget {

  final double screenWidth,screenHeight;
  final Color color;
  final bool isSwitchOn;
  final LinearGradient gradient;
  Lamp({@required this.screenHeight,@required this.screenWidth, @required this.color, @required  this.isSwitchOn,@required this.gradient});
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight * 0.15,
      left: -screenWidth * 1,
      width: screenWidth * 2,
      child: ClipPath(
        clipper:TrapeClipper(),
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.2,
              color: color,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: screenHeight * 0.6,
              decoration: BoxDecoration(
                gradient: isSwitchOn ? gradient:null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TrapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.7, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.1, size.height);
    path.lineTo(size.width * 0.4, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
 