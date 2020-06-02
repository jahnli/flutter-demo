import 'package:flutter/material.dart';
import 'package:flutter_demo/game_list/context_heading.dart';
import 'package:flutter_demo/game_list/custom_progress.dart';
class GameListDetail extends StatefulWidget {
  final String tag;
  final String title;
  final String desc;
  final String img;
  const GameListDetail({Key key, this.tag, this.img, this.title, this.desc}) : super(key: key);
  
  @override
  _GameListDetailState createState() => _GameListDetailState();
}

class _GameListDetailState extends State<GameListDetail> {
  List _list = [
    {'name':'Time','progress':0.3},
    {'name':'Mastery','progress':0.5},
    {'name':'Rank','progress':0.7},
    {'name':'Skill','progress':0.3},
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child:Stack(
              children: <Widget>[
                Hero(
                  tag: widget.tag, 
                  child: Image.network('${widget.img}',height: 370,fit: BoxFit.cover),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(3)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 15),
                              ),
                              Container(height: 10, child: VerticalDivider(color: Colors.grey[400])),
                              Icon(Icons.menu,color: Colors.white,size: 20),
                            ]
                          ),
                          Icon(Icons.search,color: Colors.white,size: 20,),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        Text('${widget.title}',style: TextStyle(color: Colors.white,fontSize: 30)),
                        Text('${widget.desc}',style: TextStyle(color: Colors.white.withOpacity(.9),fontSize: 20)),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [Colors.red[200],Colors.red[400]])
                            ),
                            child: Text('Play',style: TextStyle(color: Colors.white),),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30)
                  ],
                )
              ],
            )
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ContextHeading(heading: 'Degree of love'),
                for (int i = 0; i < _list.length; i++) 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        width: 60,
                        child: Text('${_list[i]['name']}'),
                      ),
                      SizedBox(width: 30),
                      CustomProgress(progress: _list[i]['progress'],screenWidth:screenWidth),
                    ],
                  ),
              ],
            ),
          )
        ],
      ) ,
    );
  }
}