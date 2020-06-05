import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Theming extends StatefulWidget {
  @override
  _ThemingState createState() => _ThemingState();
}

class _ThemingState extends State<Theming> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // darkTheme: ThemeData(
      //   primarySwatch: Colors.green
      // ),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme'),elevation: 0,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.home),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Today',style: TextStyle(fontSize: 25)),
                  Icon(Icons.add_circle_outline,size: 25,)
                ],
              ),
              SizedBox(height: 30),
              Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('青钢影'),
                  subtitle: Text('我没说你可以走了'),
                  trailing: Icon(Icons.check_circle),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}