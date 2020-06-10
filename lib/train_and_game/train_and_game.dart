import 'package:flutter/material.dart';
class TrainAndGame extends StatefulWidget {
  @override
  _TrainAndGameState createState() => _TrainAndGameState();
}

class _TrainAndGameState extends State<TrainAndGame> {

  final List _list = [
    {'name':'卡莎','atk':59,'price':'4500点券/6300精萃','img':'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2096403588,3010848160&fm=26&gp=0.jpg'},
    {'name':'薇恩','atk':60,'price':'4800精萃/3000点券','img':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=850932594,795374218&fm=26&gp=0.jpg'},
    {'name':'卡蜜尔','atk':68,'price':'6300精萃/4500点券','img':'https://bkimg.cdn.bcebos.com/pic/8c1001e93901213f98232ff45de736d12f2e9581?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg'},
    {'name':'塞拉斯','atk':61,'price':'4500点券/6300精萃','img':'https://bkimg.cdn.bcebos.com/pic/a8ec8a13632762d0def86733adec08fa503dc67c?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg'},
  ];

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
            height: _height * 0.3,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20)
              ),
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: _height * 0.31,
            right: 0,
            left: 0,
            child: Container(
              height: _height * 0.6,
              child: Column(
                children: [
                   Container(
                     alignment: Alignment.centerLeft,
                     padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                     child: Text('League of Legends',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                   ),
                   Expanded(
                     child: SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: Row(
                         children: [
                           for (int i = 0; i < _list.length; i++) 
                              _item(_list[i])
                         ],
                       ),
                     )
                   ),
                   Expanded(
                     child: Container(
                       decoration: BoxDecoration(
                         gradient: LinearGradient(colors: [Color(0xff20008b),Color(0xff200087)])
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

  Widget _item(item){
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8,
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