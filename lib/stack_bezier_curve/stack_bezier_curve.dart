import 'package:flutter/material.dart';

class StackBezierCurve extends StatefulWidget {
  @override
  _StackBezierCurveState createState() => _StackBezierCurveState();
}

class _StackBezierCurveState extends State<StackBezierCurve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('堆叠贝塞尔曲线'),),
      body: Stack(
        children: <Widget>[
          ClipPath(
             clipper: _CustomThreeClipper(),
             child: Container(
               height: 450,
               color: Colors.purple.withOpacity(0.1),
             ),
          ),
          Positioned(
            child: ClipPath(
             clipper: _CustomTwoClipper(),
              child: Container(
                height: 350,
                color: Colors.purple.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            child: ClipPath(
             clipper: _CustomClipper(),
              child: Container(
                height: 200,
                color: Colors.purple.withOpacity(0.4),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CustomThreeClipper extends CustomClipper<Path>{
  @override
  getClip(Size size){
    final Path path = Path();
    path.lineTo( 0,size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.3, size.width * 0.2, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.5, size.width * 0.4, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.2, size.width * 0.7, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.5, size.width, size.height * 0.4);
    // path.quadraticBezierTo(size.width, size.height * 0.7, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class _CustomTwoClipper extends CustomClipper<Path>{
  @override
  getClip(Size size){
    final Path path = Path();
    path.lineTo( 0,size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.5, size.width * 0.2, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.3, size.width * 0.4, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.6, size.width * 0.6, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.65, size.height * 0.2, size.width * 0.8, size.height * 0.4);
    path.quadraticBezierTo(size.width, size.height * 0.7, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class _CustomClipper extends CustomClipper<Path>{

  @override
  getClip(Size size){
    final Path path = Path();
    path.lineTo( 0,size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.6, size.width * 0.2, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.3, size.height, size.width * 0.4, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.5, size.width * 0.67, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.8, size.height , size.width, size.height * 0.6);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }


  @override
  bool shouldReclip(CustomClipper oldClipper) => true;

}
