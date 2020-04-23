import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_painter/custom_painter.dart';
import 'package:flutter_demo/despicable_me/character_listing_screen.dart';
import 'package:flutter_demo/flight_tickets/flight_tickets.dart';
import 'package:flutter_demo/hero/home.dart';
import 'package:flutter_demo/tab_strip/tab_strip.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MainApp',
      home: MainPage(),
      theme: ThemeData(
        primarySwatch:Colors.blue,
        appBarTheme: AppBarTheme(
          color:Colors.orange.shade200
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatelessWidget {

  List _lists = [
    {"name":'Hero动画',"page":HeroHome(),"tags":['Hreo过渡','仿App stroe 卡片按压动画','动画']},
    {"name":'卑鄙的我',"page":CharacterListingScreen(),"tags":['自定义Clipper','贝塞尔曲线','Pageview过渡动画','Hero','自定义底部卡片']},
    {"name":'选项卡动画',"page":TabStrip()},
    {"name":'广告投放页面',"page":FlightTickets(),"tags":['自定义Clipper','页面传参']},
    {"name":'CustomPainter',"page":CustomPainterDemo(),"tags":['贝塞尔曲线','CustomPainter','Canvas']},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          _screenTop(),
          Expanded(child: _list())
        ],
      )
    );
  }

  Widget _list(){
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context,index){
        final item = _lists[index];
        return  _to(item['name'],item['page'],item['tags'],context);
      },
      itemCount: _lists.length,
    );
  }

  Widget _screenTop(){
    return ClipPath(
      clipper: _CustomClipper(),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Colors.orange.shade200,Colors.orange.shade400]
          )
        ),
      ),
    );
  } 

  Widget _to(name,path,tags,context){
    return Card(
      elevation: 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1,color: Colors.grey)
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) =>path));
          },
          child: ListTile(
            title: Text(name,style:TextStyle(fontSize: 18,color: Colors.orange.shade400)),
            subtitle: ( tags != null && tags.length > 0) ? Wrap(
              spacing: 8,
              children: tags.map<Widget>((tag){
                return tag != '' ? Chip(label: Text(tag),labelPadding:EdgeInsets.symmetric(vertical: 0,horizontal: 8)):Container();
              }).toList(),
            ):null
          ),
        ),
      ),
    );
  }
}


class _CustomClipper extends CustomClipper<Path>{

  @override
  getClip(Size size){
    final Path path = Path();
    path.lineTo(0, size.height - 40);
    var firstEndPoint = Offset(size.width * 0.5 , size.height - 40);
    var firstControlPoint = Offset(size.width * 0.25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx,firstEndPoint.dy);

    var secondEndPoint = Offset(size.width  , size.height - 40);
    var secondControlPoint = Offset(size.width * 0.8, size.height - 80);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx,secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }


  @override
  bool shouldReclip(CustomClipper oldClipper) => true;

}