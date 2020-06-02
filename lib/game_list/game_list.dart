import 'package:flutter/material.dart';
import 'package:flutter_demo/game_list/context_heading.dart';
import 'package:flutter_demo/game_list/detail.dart';
import 'package:flutter_demo/game_list/games_list_item.dart';
import 'package:flutter_demo/game_list/rounded_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    List _gamesList = [
      {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591090365115&di=14545376e742b1c314ae58369616ba23&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn01%2F468%2Fw870h398%2F20180601%2Fe92a-hcikcev7844503.jpg','title':'LOL','desc':'Riot Games','progress':0.8,'isOnLine':true},
      {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591078264529&di=596395d511471ec97bddc7068e923a09&imgtype=0&src=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D1388123173%2C3271634528%26fm%3D214%26gp%3D0.jpg','title':'PUBG','desc':'蓝洞','progress':0.5,'isOnLine':true},
      {'img':'http://imgsrc.baidu.com/forum/w=580/sign=1995351d15dfa9ecfd2e561f52d0f754/66caa66eddc451da6a8d5beab2fd5266d0163253.jpg','title':'CF','desc':'腾讯游戏','progress':0.7,'isOnLine':true},
      {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591078983052&di=cfae4b1f2894265b3561973b028444c8&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2F6fdfe53f528d347740f8e0d90614d92bb9d55e17.jpg','title':'梦三国','desc':'电魂','progress':0.6,'isOnLine':false},
    ];

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(screenWidth * 0.6,10),
              child: Transform.rotate(
                angle: -0.5,
                child: SvgPicture.asset('assets/images/stadia/stadia_logo.svg',height: screenHeight * 0.3,color: Color(0xfffce3e0)),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.home,color: Color(0xffa7a7a7),size: 22),
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                        child: RoundedImage(imgPath: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3121118450,3508281238&fm=26&gp=0.jpg',showRanking: true,ranking: 30,isOnLine: true),
                      ),
                      SizedBox(width: 20),
                      Text('Kaisa',style: TextStyle(fontSize: 25))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            Text('Kaisa',style: TextStyle(fontSize: 20),),
                            SizedBox(height: 20),
                            Text('我回来，是为了那些回不来的人',style: TextStyle(color:Colors.grey,fontSize: 14),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  ContextHeading(heading: 'Favorite game'),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GameListDetail(
                              tag:_gamesList[index]['desc'],
                              img:_gamesList[index]['img'],
                              title:_gamesList[index]['title'],
                              desc:_gamesList[index]['desc'],
                          )));
                        },
                        child: Hero(
                          tag: _gamesList[index]['title'], 
                          child: GamesListItem(
                            image:_gamesList[index]['img'],
                            title: _gamesList[index]['title'],
                            description:_gamesList[index]['desc'],
                            progress: _gamesList[index]['progress'],
                            screenWidth:screenWidth
                          )
                        )
                      );
                    },
                    itemCount: _gamesList.length,
                  ),
                  ContextHeading(heading: 'Ranking'),            
                  Row(            
                    mainAxisAlignment: MainAxisAlignment.spaceAround,         
                    children: <Widget>[
                      for (int i = 0; i < _gamesList.length; i++)
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => GameListDetail(
                              tag:_gamesList[i]['desc'],
                              img:_gamesList[i]['img'],
                              title:_gamesList[i]['title'],
                              desc:_gamesList[i]['desc'],
                            )));
                          },
                          child: Hero(
                            tag: _gamesList[i]['desc'], 
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                              child: RoundedImage(imgPath:_gamesList[i]['img'],showRanking: true,ranking: i + 1,isOnLine: _gamesList[i]['isOnLine']),
                            )
                          ),
                        )
                        
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}