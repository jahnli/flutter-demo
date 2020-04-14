import 'package:flutter/material.dart';

class CharacterDetail extends StatefulWidget {
  @override
  _CharacterDetailState createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              
            )
          ),
          Column(
            children:<Widget>[
              SizedBox(height:50),
              Icon(Icons.close,color:Colors.black)
            ]
          ),
        ]
      )
    );
  }
}