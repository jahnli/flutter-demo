import 'package:flutter/material.dart';
import 'package:flutter_demo/animated_toggle_button/animated_toggle_button.dart';
import 'package:flutter_demo/animation_carouse/animation_carouse.dart';
import 'package:flutter_demo/collapse_sidebar/collapse_sidebar.dart';
import 'package:flutter_demo/custom_painter/custom_painter.dart';
import 'package:flutter_demo/despicable_me/character_listing_screen.dart';
import 'package:flutter_demo/flight_tickets/flight_tickets.dart';
import 'package:flutter_demo/hero/home.dart';
import 'package:flutter_demo/stack_bezier_curve/stack_bezier_curve.dart';
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
          elevation: 0,
          color:Colors.orange.shade200,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatelessWidget {

  List _lists = [
    {"name":'Animation Carouse',"page":AnimationCarouse(),"tags":['Animation'],"date":'2020-04-26'},
    {"name":'Collapse SideBar',"page":CollapseSideBar(),"tags":['Drawer'],"date":'2020-04-24'},
    {"name":'AnimatedToggleButton',"page":AnimatedToggleButton(),"tags":['渲染回调','获取元素大小','Animated'],"date":'2020-04-24'},
    {"name":'堆叠贝塞尔曲线',"page":StackBezierCurve(),"tags":['贝塞尔曲线'],"date":'2020-04-23'},
    {"name":'CustomPainter',"page":CustomPainterDemo(),"tags":['贝塞尔曲线','CustomPainter','Canvas'],"date":'2020-04-23'},
    {"name":'广告投放页面',"page":FlightTickets(),"tags":['自定义Clipper','页面传参'],"date":'2020-04-21'},
    {"name":'选项卡动画',"page":TabStrip(),"date":'2020-04-20'},
    {"name":'卑鄙的我',"page":CharacterListingScreen(),"tags":['自定义Clipper','贝塞尔曲线','Pageview过渡动画','Hero','自定义底部卡片'],"date":'2020-04-15'},
    {"name":'Hero动画',"page":HeroHome(),"tags":['Hreo过渡','仿App stroe 卡片按压动画','动画'],"date":'2020-04-13'},
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
        return  _to(name:item['name'],page:item['page'],date:item['date'],tags:item['tags'],context:context);
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

  Widget _to({name,page,tags,context,date}){
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
            Navigator.push(context,MaterialPageRoute(builder: (context) => page));
          },
          child: ListTile(
            trailing:Text(date),
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