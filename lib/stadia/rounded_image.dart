import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RoundedImage extends StatelessWidget {
  final String imgPath;
  final double imageSize = 60;
  final bool isOnLine;
  final int ranking;
  final bool showRanking;
  final String name;
  RoundedImage({@required this.imgPath, this.isOnLine = false, this.showRanking = false, this.name, this.ranking = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: imageSize + 8,
          child: Stack(
            children: <Widget>[
              CustomPaint(
                painter: RoundedImageBorder(isOnline: isOnLine),
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  child:ClipOval(
                    child:  Image.network(imgPath,fit: BoxFit.cover,),
                  ),
                ),
              ),
              if (showRanking)
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: ClipOval(
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xfffc4a1f).withOpacity(0.4),Color(0xffaf1055).withOpacity(0.4)])),
                      child: Center(
                        child: Text(
                          ranking.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if(name != null) Text(name)
      ],
    );
  }
}

class RoundedImageBorder extends CustomPainter {
  final bool isOnline;

  RoundedImageBorder({this.isOnline});


  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    if (isOnline) {
      borderPaint.shader = LinearGradient(colors: [Color(0xfffc4a1f).withOpacity(0.5),Color(0xffaf1055).withOpacity(0.5)]).createShader(Rect.fromCircle(center: center, radius: size.width / 2));
    } else {
      borderPaint.color = Color(0xffa7a7a7);
    }

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2), math.radians(-90), math.radians(360), false, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}