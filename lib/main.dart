import 'package:flutter/material.dart';
import 'package:flutter_demo/despicable_me/character_listing_screen.dart';
import 'package:flutter_demo/hero/home.dart';
import 'package:flutter_demo/tab_strip/tab_strip.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MainApp',
      home: MainPage(),
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Demo演示')
      ),
      body:Container(
        padding: EdgeInsets.all(20),
        child: Wrap(
          spacing:10,
          children: <Widget>[
            _to('Hero动画',HeroHome(),context),
            _to('卑鄙的我动画',CharacterListingScreen(),context),
            _to('选项卡动画',TabStrip(),context),
          ],
        )
      )
    );
  }

  Widget _to(name,path,context){
    return MaterialButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) =>path));
      },
      child: Text(name),
    );
  }

}