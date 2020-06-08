import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:battery/battery.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:app_settings/app_settings.dart';


class GetDevices extends StatefulWidget {
  @override
  _GetDevicesState createState() => _GetDevicesState();
}

class _GetDevicesState extends State<GetDevices> {

  // 网络
  var subscription;

  @override
  void initState() { 
    super.initState();
  }

  @override
  void dispose() {
    Fluttertoast.cancel();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设备相关'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton( onPressed: () => _scan(), child: Text('条码扫描')),
            RaisedButton( onPressed: () => _detectionInter(), child: Text('检测网络状态')),
            RaisedButton( onPressed: () => _getDevices(), child: Text('打印设备信息')),
            RaisedButton( onPressed: () => _getBattery(), child: Text('打印电池')),
            RaisedButton( onPressed: () => AppSettings.openBluetoothSettings(), child: Text('打开蓝牙设置')),
            RaisedButton( onPressed: () => _quickActions(), child: Text('创建快捷方式（长按桌面图标查看）')),
          ],
        ),
      ),
    );
  }

  // 扫描
  void _scan() async{
    ScanOptions options = ScanOptions(
       strings: {
          "cancel": '取消',
          "flash_on": '打开闪光灯',
          "flash_off": '关闭闪光灯',
        },
        // 开始扫描时启用闪光灯
        autoEnableFlash: false,
    );
    ScanResult result = await BarcodeScanner.scan(options: options);
    Fluttertoast.showToast(
      msg: '''
        结果类型：${result.type}
        条形码内容：he barcode format (as enum)${result.rawContent}
        条码格式：${result.format}
        未知格式被扫描，包含一个注释：${result.formatNote}
      ''',
      gravity: ToastGravity.CENTER,
    );
  }

  // 检测网络状态
  void _detectionInter()async{
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        Fluttertoast.showToast(
          msg: "当前移动网络",
          gravity: ToastGravity.CENTER,
        );
      } else if (connectivityResult == ConnectivityResult.wifi) {
        Fluttertoast.showToast(
          msg: "当前Wifi",
          gravity: ToastGravity.CENTER,
        );
      }
      // 初始化监听网络
      subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
          Fluttertoast.showToast(
            msg: "当前是$result",
            gravity: ToastGravity.CENTER,
          );
      });
  }

  // 创建快捷方式
  void _quickActions() async{
  final QuickActions quickActions = QuickActions();
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'action_main') {
        print('The user tapped on the "Main view" action.');
      }
    });
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(type: 'action_main', localizedTitle: 'Flutter', icon: 'icon_main'),
      const ShortcutItem(type: 'action_help', localizedTitle: 'Jahn', icon: 'icon_help')
    ]);
  }

  // 获取电池状态
  void _getBattery() async{
    Battery battery = Battery();
    print(await battery.batteryLevel);
    // 当状态(满、充、放电)发生变化时通知
    battery.onBatteryStateChanged.listen((BatteryState state) {
      print(state);
    });
  }

  // 获取设备信息
  void _getDevices()async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('设备+用户和应用程序签名之间唯一的Android硬件设备ID: ${androidInfo.androidId}'); 
    print('基础板的名称: ${androidInfo.board}'); 
    print('系统引导加载程序版本号: ${androidInfo.bootloader}'); 
    print('与产品/硬件相关联的消费者可见的品牌（如果有）: ${androidInfo.brand}'); 
    print('工业品外观设计的名称。: ${androidInfo.device}'); 
    print('用于向用户显示的构建ID字符串。: ${androidInfo.display}'); 
    print('指纹 → 字符串: ${androidInfo.fingerprint}'); 
    print('硬件的名称（从内核命令行或/ proc）: ${androidInfo.hardware}'); 
    print('主机名: ${androidInfo.host}'); 
    print('id: ${androidInfo.id}'); 
    print('如果应用程序在模拟器中运行，则为true: ${androidInfo.isPhysicalDevice}'); 
    print('产品/硬件的制造商。: ${androidInfo.manufacturer}'); 
    print('型号 : ${androidInfo.model}'); 
    print('产品的名称 : ${androidInfo.product}'); 
    print('描述构建的标签 : ${androidInfo.tags}'); 
  }

  

}
