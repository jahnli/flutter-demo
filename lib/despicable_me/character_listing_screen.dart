import 'package:flutter/material.dart';
import 'package:flutter_demo/despicable_me/character_widget.dart';
import 'package:flutter_demo/despicable_me/style_guide.dart';

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      keepPage: false
    );
    print(_pageController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(250, 250, 250, 0),
          elevation: 0,
          title: Text('卑鄙的我', style: TextStyle(color: Colors.black)),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.search, color: Colors.black),
            )
          ],
        ),
        body: SafeArea(
            child: Column(children: [
          Container(
              padding: EdgeInsets.only(left: 30, top: 30),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(text: '你给我里Giao Giao', style: AppTheme.display1),
                TextSpan(text: '\n'),
                TextSpan(text: '集美们', style: AppTheme.display2),
                TextSpan(text: '梅厚涛'),
              ]))),
          Expanded(
            child: PageView(
              controller: _pageController,
              children:<Widget>[
                for (int i = 0; i < 2; i++) 
                  CharacterWidget(index:i,pageController:_pageController,currentPage:_currentPage)
              ]
            ),
          )
        ])));
  }
}
