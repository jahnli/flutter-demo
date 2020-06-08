import 'dart:async';
import 'package:flutter/material.dart';

class SidebarAnimation extends StatefulWidget {
  @override
  _SidebarAnimationState createState() => _SidebarAnimationState();
}

class _SidebarAnimationState extends State<SidebarAnimation> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  double _screenWidth;
  StreamController _streamController; 
  Stream _stream;
  StreamSink _streamSink;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _streamController = StreamController();
    _stream = _streamController.stream;
    _streamSink = _streamController.sink;
  }

  @override
  void dispose() {
    _streamSink.close();
    _animationController.dispose();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Stack(
        children: [
          _homePage(),
          _sidebar()
        ],
      )
    );
  }

  Widget _sidebar(){
    return StreamBuilder<Object>(
      initialData: false,
      stream: _stream,
      builder: (context, snapshot) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          top: 0,
          bottom: 0,
          left:snapshot.data ? 0 : -_screenWidth * 0.7,
          right: snapshot.data ? _screenWidth * 0.3 : _screenWidth - 40,
          child: Row(
            children: [
              // sidebar区域
              Expanded(
                child: Container(
                  color: Colors.blueAccent.shade200,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          children: [
                            Icon(Icons.account_circle,size: 35,color: Colors.white,),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text('Jahn',style: TextStyle(color: Colors.white),),
                                  Text('Jahnli@163.com',style: TextStyle(fontSize:12,color: Colors.white.withOpacity(.5)),)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        title: Text('青钢影',style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white.withOpacity(.5),),
                        subtitle: Text('我没说你可以走了。',style: TextStyle(color: Colors.white.withOpacity(.5))),
                      ),
                      ListTile(
                        title: Text('深海泰坦',style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white.withOpacity(.5),),
                        subtitle: Text('倘若你迷失在黑暗之中，除了前行别无他法。',style: TextStyle(color: Colors.white.withOpacity(.5))),
                      ),
                      ListTile(
                        title: Text('烬',style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white.withOpacity(.5),),
                        subtitle: Text('我于杀戮之中盛放，亦如黎明中的花朵。',style: TextStyle(color: Colors.white.withOpacity(.5))),
                      )
                    ],
                  ),
                ),
              ),
              // 按钮区域
              GestureDetector(
                onTap: (){
                  final _status = _animationController.status;
                  final _complted = _status == AnimationStatus.completed;
                  if(_complted){
                    _animationController.reverse();
                    _streamSink.add(false); 
                  }else{
                    _animationController.forward();
                    _streamSink.add(true); 
                  }
                },
                child: Align(
                  alignment:Alignment(0, -0.8) ,
                  child: ClipPath(
                    clipper: CustomClip(),
                    child: Container(
                      width: 40,
                      height: 80,
                      alignment: Alignment.centerLeft,
                      color: Colors.blueAccent.shade200,
                      child: AnimatedIcon(
                        color: Colors.white,
                        progress: _animationController.view,
                        icon:AnimatedIcons.menu_close,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }

  Widget _homePage(){
    return Center(
      child: Text('Jahn'),
    );
  }

}

class CustomClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0,0);
    path.quadraticBezierTo(size.width * 0.06, size.height * 0.06,size.width * 0.6 ,size.height *0.3);
    path.quadraticBezierTo(size.width, size.height * 0.5,size.width * 0.3 , size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.9, 0 , size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
 