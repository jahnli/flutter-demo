import 'package:flutter/material.dart';

class TabStrip extends StatefulWidget {
  @override
  _TabStripState createState() => _TabStripState();
}

class _TabStripState extends State<TabStrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('选项卡动画')
      ),
      body: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:Colors.black26,
            width:1
          )
        ),
        child:Stack(
          children: <Widget>[
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            Container(
              
            )
            Text('Filter',style: TextStyle(fontSize: 20,color: Colors.black)),
          ],
        )
      ),
    );
  }
}