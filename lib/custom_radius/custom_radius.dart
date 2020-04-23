import 'package:flutter/material.dart';
class CustomRadius extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自定义半径图'),),
      body: Stack(
        children: <Widget>[
          ClipPath(
             clipper: _CustomTwoClipper(),
             child: Container(
               height: 400,
               color: Colors.purple.shade100,
             ),
          ),
          Positioned(
            child: ClipPath(
             clipper: _CustomClipper(),
              child: Container(
                height: 200,
                color: Colors.purple,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CustomTwoClipper extends CustomClipper<Path>{

  @override
  getClip(Size size){
    final Path path = Path();
    path.lineTo( 0,size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.5, size.width * 0.2, size.height * 0.4);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
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

