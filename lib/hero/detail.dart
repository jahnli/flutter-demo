import 'package:flutter/material.dart';

class HeroDetail extends StatefulWidget {
  @override
  _HeroDetailState createState() => _HeroDetailState();
}

class _HeroDetailState extends State<HeroDetail> {
  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title:Text('Hero - 详情页')),
      body: Container(
        alignment: Alignment.topCenter,
        child:Hero(tag: 'test$index', child: Image.network('http://cdn.jahnli.cn/user_img.png?imageslim',))
      )
    );
  }
}