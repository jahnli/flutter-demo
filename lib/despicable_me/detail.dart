import 'package:flutter/material.dart';
import 'package:flutter_demo/despicable_me/style_guide.dart';

class CharacterDetail extends StatefulWidget {
  int index;
  CharacterDetail(this.index);
  @override
  _CharacterDetailState createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children:<Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient:LinearGradient(
                    colors: [Colors.orange.shade200,Colors.orange.shade900],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft
                  )
                )
              ),
              SingleChildScrollView(
                child:Container(
                  padding: EdgeInsets.only(left:20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      SizedBox(height:50),
                      GestureDetector(
                        onTap:(){
                          Navigator.pop(context);
                        },
                        child:Icon(Icons.close,color:Colors.white,size: 40,)
                      ),
                      Container(
                        alignment:Alignment.topRight,
                        child:Hero(tag: 'character', child: Image.asset(widget.index == 1 ? 'assets/images/Kevin_minions.png':'assets/images/Agnes_gru.png',height: screenHeight * 0.35))
                      ),
                      Text(widget.index == 1 ? 'Hanson':'Jahn',style: AppTheme.heading,),
                      Text('兄弟们冲 兄弟们冲 兄弟们兄弟们兄弟们冲',style: AppTheme.subHeading),
                      Text('鸡妹们',style: AppTheme.subHeading),
                    ]
                  ),
                ),
              )
            ]
          ),
        ),
      )
    );
  }
}