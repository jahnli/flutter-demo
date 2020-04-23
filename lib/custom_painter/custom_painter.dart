import 'package:flutter/material.dart';

class CustomPainterDemo extends StatefulWidget {
  @override
  _CustomPainterDemoState createState() => _CustomPainterDemoState();
}

class _CustomPainterDemoState extends State<CustomPainterDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPainterDemo'),
      ),
      body: CustomPaint(
        painter: _CustomPainter(),
        child: Container(
        ),
      )
    );
  }
}


class _CustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas,Size size){
    // 整体
    Paint paint = Paint();
    Path mainPath = Path();
    mainPath.addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    paint.color = Color(0xff652a78);
    canvas.drawPath(mainPath, paint);

    // 紫色区域
    Path purplePath = Path();
    purplePath.lineTo(180, 0);
    purplePath.quadraticBezierTo(130, 130, 0, 200);
    purplePath.close();
    paint.color = Color(0xff8132ad);
    canvas.drawPath(purplePath, paint);

    // 三角形路径
    Path trianglePath = Path();
    trianglePath.lineTo(0, 100);
    trianglePath.lineTo(100,0);
    trianglePath.close();
    paint.color = Color(0xff99d5e5);
    canvas.drawPath(trianglePath, paint);

    // 红色
    Path redPath = Path();
    redPath.moveTo(size.width, 0);
    redPath.quadraticBezierTo(size.width * 0.5,size.height * 0.1, 0, size.height);
    redPath.lineTo(size.width * 0.25, size.height);
    redPath.quadraticBezierTo(size.width * 0.6,size.height * 0.4, size.width , size.height * 0.4);
    paint.color = Color(0xffde3c10);
    canvas.drawPath(redPath, paint);


    // 橘色
    Path orangePath = Path();
    orangePath.moveTo(0,size.height);
    orangePath.lineTo(0,size.height * .6);
    orangePath.quadraticBezierTo(size.width * 0.5,size.height * 0.6, size.width * 0.7 , size.height);
    paint.color = Colors.orange;
    canvas.drawPath(orangePath, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
      return oldDelegate != this;
  }

}