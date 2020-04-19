
import 'package:flutter/material.dart';

class TabStrip extends StatefulWidget {
  @override
  _TabStripState createState() => _TabStripState();
}

class _TabStripState extends State<TabStrip> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> _textPadding;
  Animation<double> _closeAnimation;
  Animation<double> _dotHeightAnimation;
  Animation<double> _dotTopAnimation;
  Animation<double> _dotLeftAnimation;
  Animation<Color> _textColorAnimation;
  final GlobalKey _parentContainer = GlobalKey(debugLabel: 'p');

  @override
  void initState() {
     super.initState();
     _animationController = AnimationController(
       vsync: this,
       duration: Duration(milliseconds: 300)
     );
     _textPadding = Tween<double>(begin: 60,end: 40).animate(_animationController);
     _closeAnimation = Tween<double>(begin: 0,end: 1).animate(_animationController);
     _dotHeightAnimation = Tween<double>(begin: 20,end: 40).animate(_animationController);
     _dotTopAnimation = Tween<double>(begin: 10,end: 0).animate(_animationController);
     _dotLeftAnimation = Tween<double>(begin: 10,end: 0).animate(_animationController);
     _textColorAnimation = ColorTween(begin: Colors.black,end:Colors.white).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get getAnimationStatus{
    AnimationStatus status = _animationController.status;
    print(status);
    return status == AnimationStatus.completed;
  }

  Animation<double> _getDocAnimation(){
    double width = 20;
    if(_parentContainer.currentContext !=null){
      RenderBox renderBox = _parentContainer.currentContext.findRenderObject();
      width = renderBox.size.width;  
    }
    print(width);
    return Tween<double>(begin: 20,end:width).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('选项卡动画')
      ),
      body:Center(
        child:  GestureDetector(
          onTap: (){
            print('点击');
            getAnimationStatus ? _animationController.reverse():_animationController.forward();
          },
          child: AnimatedBuilder(
            animation: _animationController,
            builder:(context,child) => Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:Colors.black26,
                  width:1
                )
              ),
              child:Stack(
                key: _parentContainer,
                children: <Widget>[
                  Positioned(
                    left: _dotTopAnimation.value,
                    top: _dotLeftAnimation.value,
                    child: Container(
                      width: _getDocAnimation().value,
                      height: _dotHeightAnimation.value,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  Align(
                    widthFactor: 1,
                    alignment: Alignment.center,
                    child:Container(
                      padding: EdgeInsets.only(left:_textPadding.value,right:_textPadding.value),
                      child: Text('Jahn',style: TextStyle(fontSize: 20,color: _textColorAnimation.value)),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    top: 10,
                    child: ScaleTransition(
                      scale: _closeAnimation,
                      child: Icon(
                        Icons.close,size: 20,
                        color: _textColorAnimation.value,
                      ),
                    )
                  ),
                ],
              )
            ),
          )
        ),
      )
    );
  }
}