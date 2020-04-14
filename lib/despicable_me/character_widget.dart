import 'package:flutter/material.dart';
import 'package:flutter_demo/despicable_me/detail.dart';
import 'package:flutter_demo/despicable_me/style_guide.dart';

class CharacterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(
          transitionDuration: Duration(microseconds: 350),
          pageBuilder: (context,_,__) => CharacterDetail()
        ));
      },
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child:ClipPath(
              clipper: CharacterCardClipper(),
              child:Container(
                height:screenHeight * 0.6 ,
                width: 0.4 * screenHeight,
                decoration: BoxDecoration(
                  gradient:LinearGradient(
                    colors: [Colors.orange.shade200,Colors.orange.shade900],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft
                  )
                ),
              )
            )
          ),
          Align(
            alignment:Alignment.topCenter,
            child:Image.asset('assets/images/Kevin_minions.png',height: screenHeight * 0.55,)
          ),
          Container(
            margin: EdgeInsets.only(left:100,bottom:100),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Hanson',style: AppTheme.heading,),
                Text('集美们 Click to read more',style: AppTheme.subHeading,)
              ],          
            )
          )
        ],
      ),
    );
  }
}


class CharacterCardClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;
    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0 , size.height - curveDistance);
    clippedPath.quadraticBezierTo(1,size.height - 1, curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width+1, size.height - 1, size.width, size.height - curveDistance);
    clippedPath.lineTo(size.width, curveDistance);
    clippedPath.quadraticBezierTo(size.width-1, 0, size.width - curveDistance - 5 , curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(1, size.height * 0.3 + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}