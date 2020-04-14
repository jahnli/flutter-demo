import 'package:flutter/material.dart';

class DespicableMe extends StatefulWidget {
  @override
  _DespicableMeState createState() => _DespicableMeState();
}

class _DespicableMeState extends State<DespicableMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('卑鄙的我'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), 
          onPressed:(){
            Navigator.pop(context);
          }
        ),
        actions: <Widget>[
          Icon(Icons.search)
        ],
      ),
      body: Container(

      ),
    );
  }
}