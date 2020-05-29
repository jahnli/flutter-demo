import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter_demo/animated_toggle_button/animated_toggle_button.dart';
import 'package:flutter_demo/animation_button/animation_button.dart';
import 'package:flutter_demo/animation_carouse/animation_carouse.dart';
import 'package:flutter_demo/app_upgrade/app_upgrade.dart';
import 'package:flutter_demo/bezier_curve_cart/bezier_curve_cart.dart';
import 'package:flutter_demo/collapse_sidebar/collapse_sidebar.dart';
import 'package:flutter_demo/custom_painter/custom_painter.dart';
import 'package:flutter_demo/despicable_me/character_listing_screen.dart';
import 'package:flutter_demo/flight_tickets/flight_tickets.dart';
import 'package:flutter_demo/devices/decices.dart';
import 'package:flutter_demo/hero/home.dart';
import 'package:flutter_demo/image_picker/image_picker.dart';
import 'package:flutter_demo/jpush/jpush.dart';
import 'package:flutter_demo/live_stream/live_stream.dart';
import 'package:flutter_demo/socket/chat.dart';
import 'package:flutter_demo/socket/socket.io.dart';
import 'package:flutter_demo/stack_bezier_curve/stack_bezier_curve.dart';
import 'package:flutter_demo/tab_strip/tab_strip.dart';
import 'package:flutter_demo/amap_location/amap_location.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    return MaterialApp(
      title: 'MainApp',
      home: MainPage(),
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
          //此处
          const Locale('zh', 'CH'),
          const Locale('en', 'US'),
      ],
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          textTheme:ButtonTextTheme.primary,
          buttonColor: Colors.blue,
        ),
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
    {"name":'直播',"page":LiveStream(),"tags":['贝塞尔曲线','获取元素位置'],"date":'2020-05-29'},
    {"name":'贝塞尔曲线实现添加购物车',"page":BezierCurveCart(),"tags":['贝塞尔曲线','获取元素位置'],"date":'2020-05-28'},
    {"name":'聊天室',"page":Chat(),"tags":['socket.io','发送图片'],"date":'2020-05-27'},
    {"name":'SocketIo',"page":SocketIo(),"tags":['socket.io'],"date":'2020-05-27'},
    {"name":'极光推送',"page":JPushPlugin(),"tags":['极光推送','jpush_flutter'],"date":'2020-05-27'},
    {"name":'App更新',"page":AppUpgrade(),"tags":['检测版本号','服务器下载','App自动升级与安装'],"date":'2020-05-26'},
    {"name":'image_picker',"page":ImagePickerDemo(),"tags":['拾取图像','相机拍摄'],"date":'2020-04-28'},
    {"name":'amap_map_fluttify',"page":AmapMapFluttify(),"tags":['高德地图'],"date":'2020-04-27'},
    {"name":'amap_location',"page":AmapLocation(),"tags":['高德地图获取定位信息'],"date":'2020-04-27'},
    {"name":'设备相关',"page":GetDevices(),"tags":['条码扫描','检测网络状态','设备相关信息','电池','创建快捷方式'],"date":'2020-04-27'},
    {"name":'Animation Button',"page":AnimationButton(),"tags":['Animation','Animation addListener'],"date":'2020-04-26'},
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
      padding: EdgeInsets.all(0),
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
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                return tag != '' ? Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.orange.shade200, child: Text(tag.toString().substring(0,1),style: TextStyle(fontSize: 12))),
                  label: Text(tag),labelPadding:EdgeInsets.symmetric(vertical: 0,horizontal: 8)
                ):Container();
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
    path.quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.5,size.height - 40);

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