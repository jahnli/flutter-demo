import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class JPushPlugin extends StatefulWidget {
  @override
  _JPushPluginState createState() => _JPushPluginState();
}

class _JPushPluginState extends State<JPushPlugin> {

  @override
  void initState() { 
    super.initState();
    _init();
  }
  
  _init(){
    JPush jpush = new JPush();
    // 监听广播
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("接收通知回调: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("点击通知回调: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("接收自定义消息回调： $message");
      },
    );
    // 初始化
    jpush.setup(
      appKey: "38ad75917c625c2049593749",
      channel: "theChannel",
      production: false,
      debug: false, // 设置是否打印 debug 日志
    );
    // 获取注册ID
    jpush.getRegistrationID().then((rid) {
      print('获取注册id：$rid');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('极光推送')),
      body: Container(

      ),
    );
  }
}