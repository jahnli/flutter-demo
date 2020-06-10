import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class TrainAndGame extends StatefulWidget {
  @override
  _TrainAndGameState createState() => _TrainAndGameState();
}

class _TrainAndGameState extends State<TrainAndGame> {

  final List _list = [
    {'name':'卡莎','atk':59,'price':'4500点券/6300精萃','img':'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2096403588,3010848160&fm=26&gp=0.jpg','title':'我回来，是为了那些回不来的人','subTitle':'我回来了，也变强了'},
    {'name':'薇恩','atk':60,'price':'4800精萃/3000点券','img':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=850932594,795374218&fm=26&gp=0.jpg','title':'让我们来猎杀那些陷入黑暗中的人吧','subTitle':'听见了无知的呼喊'},
    {'name':'卡蜜尔','atk':68,'price':'6300精萃/4500点券','img':'https://bkimg.cdn.bcebos.com/pic/8c1001e93901213f98232ff45de736d12f2e9581?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg','title':'我没说你可以走了','subTitle':'优雅永不过时'},
    {'name':'塞拉斯','atk':61,'price':'4500点券/6300精萃','img':'https://bkimg.cdn.bcebos.com/pic/a8ec8a13632762d0def86733adec08fa503dc67c?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg','title':'星星之火，便可燎原','subTitle':'以彼之道，还施彼身'},
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme:IconThemeData(
          color: Colors.black
        )
      ),
      backgroundColor: Color(0xffe9e9e9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20)
        ),
        child: BottomNavigationBar(
          selectedIconTheme: IconThemeData(
            color: Color(0xff200087)
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12
          ),
          items: [
            BottomNavigationBarItem(icon: Container(padding: EdgeInsets.only(top:10),child: Icon(Icons.home)),title: Text('')),
            BottomNavigationBarItem(icon: Container(padding: EdgeInsets.only(top:10),child: Icon(Icons.search)),title: Text('')),
            BottomNavigationBarItem(icon: Container(padding: EdgeInsets.only(top:10),child: Icon(Icons.person)),title: Text('')),
          ],
        ),
      ),
      body:Stack(
        children: [
          Positioned(
            top: 0,
            height: _height * 0.2,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20)
              ),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left:20,right:20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jahn'),
                            SizedBox(height: 5),
                            Text('欢迎来到召唤师峡谷',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)
                          ],
                        ),
                        ClipOval(
                          child:Image.network('http://game.gtimg.cn/images/lol/guides/polo.gif') ,
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    _progress(_height * 0.1,_height * 0.1)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: _height * 0.2,
            right: 0,
            left: 0,
            child: Container(
              height: _height * 0.55,
              child: Column(
                children: [
                   Container(
                     alignment: Alignment.centerLeft,
                     padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                     child: Text('League of Legends',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                   ),
                   Expanded(
                     flex: 2,
                     child: SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: Row(
                         children: [
                           for (int i = 0; i < _list.length; i++) 
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _current = i;
                                  });
                                },
                                child: _item(_list[i]),
                              )
                         ],
                       ),
                     )
                   ),
                   SizedBox(height: 20),
                   Expanded(
                     child: Container(
                       margin: EdgeInsets.only(left: 32,right: 32),
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         gradient: LinearGradient(colors: [Color(0xff20008b),Color(0xff200087)])
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('${_list[_current]['subTitle']}',style: TextStyle(color: Colors.white70),),
                           Text('${_list[_current]['title']}',style: TextStyle(fontSize: 20,color: Colors.white)),
                           SizedBox(height: 5),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               _skill('https://game.gtimg.cn/images/lol/act/img/spell/Summoner_flash.png'),
                               _skill('https://game.gtimg.cn/images/lol/act/img/spell/SummonerIgnite.png'),
                               _skill('https://game.gtimg.cn/images/lol/act/img/spell/Summoner_teleport.png'),
                               _skill('https://game.gtimg.cn/images/lol/act/img/spell/Summoner_exhaust.png'),
                               _skill('https://game.gtimg.cn/images/lol/act/img/spell/Summoner_boost.png'),
                               _skill('https://game.gtimg.cn/images/lol/act/img/spell/Summoner_heal.png'),
                             ],
                           )
                         ],
                       ),
                     ),
                   )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Widget _progress(width,height){
    return CustomPaint(
      painter: _Painter(progress:0.52),
      child: Container(
        height: height,
        width:width ,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text('3251场',style: TextStyle(color: Color(0xff200087).withOpacity(.5),fontSize: 12),),
            SizedBox(height: 5),
            Text('52%',style: TextStyle(fontSize: 16,color: Color(0xff200087)),),
          ],
        ),
      ),
    );
  }

  Widget _skill(path){
    return Container(
      margin: EdgeInsets.only(top: 5),
      child:Image.network('$path',width: 25),
    );
  }

  Widget _item(item){
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 3,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(item['img'],width: 120,height: 100,fit: BoxFit.fill,),
            ),
            SizedBox(height: 10),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item['name']}',style: TextStyle(fontWeight: FontWeight.w700)),
                  SizedBox(height: 5),
                  Text('初始攻击力：${item['atk']}',style: TextStyle(color: Colors.grey,fontSize: 12)),
                  SizedBox(height: 5),
                  Text('${item['price']}',style: TextStyle(color: Colors.grey,fontSize: 12),),
                ],
              ),
            )
          ],
        ),
      )
    );
  }


}

class _Painter extends CustomPainter {
  double progress;
  _Painter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..strokeWidth = 3
        ..color = Color(0xff200087)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    // canvas.drawCircle(center, size.width / 2, paint);
    canvas.drawArc(
        Rect.fromCircle(center: center,radius: size.width / 2), 
        math.radians(-90),
        math.radians(-progress * 360), 
        false,
        paint
      );
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) {
    return this != oldDelegate;
  }
}
 