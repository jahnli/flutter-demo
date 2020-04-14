import 'package:flutter/material.dart';
import 'package:flutter_demo/hero/detail.dart';
class HeroHome extends StatefulWidget {
  @override
  _HeroHomeState createState() => _HeroHomeState();
}

class _HeroHomeState extends State<HeroHome> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Hero 主页')
      ),
      body:  Center(
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _itemView(index);
          },
        )
      ),
    );
  }

  Widget _itemView(index){
    var _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    var _animation =
    Tween<double>(begin: 1, end: 0.8).animate(_animationController);
    return GestureDetector(
      onPanDown: (details){
        print(details);
        _animationController.forward();
      },
      onPanEnd:(e){
         _animationController.reverse();
      },
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> HeroDetail(),fullscreenDialog: true,
              settings: RouteSettings(arguments: index)));
      },
      child: Container(
        child: ScaleTransition(
          scale: _animation,
          child: Hero(tag: 'test$index', child:Image.network('http://cdn.jahnli.cn/user_img.png?imageslim',width: 80,height: 140)),
        ),
      )
    );
  }


}