import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

// 安卓升级流程  （IOS版本不一致直接跳转对应的应用市场）
// 1、获取本地版本号
// 2、请求服务器获取服务器版本号
// 3、本地版本和服务器版本不一致提示升级，弹窗提示用户是否升级
// 4、用户确定升级，调用文件传输方法下载APK
// 5、监听下载进度
// 6、下载完成打开APK进行安装
// 涉及到的API库
// package_info        检测版本号
// path_provider       获取文件储存路径
// flutter_downloader  flutter_downloader
// open_file           打开文件

class AppUpgrade extends StatefulWidget {
  @override
  _AppUpgradeState createState() => _AppUpgradeState();
}

class _AppUpgradeState extends State<AppUpgrade> {

  String _path = '';
  int _progress = 0;
  bool _show = false;

  ReceivePort _port = ReceivePort();

  @override
  void initState() { 
    super.initState();
    _init();
    _getPackageInfo();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }
  // 初始化
  _init() async{
    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      print('$id $status $progress');
      setState(() {
        _progress = progress;
      });
      if(status == DownloadTaskStatus.complete && progress == 100){
        print('地址：$_path/jdshop.apk');
        setState(() {
          _show = false;
          _progress = 0;
        });
        OpenFile.open('$_path/jdshop.apk');
      }
    });
	  FlutterDownloader.registerCallback(downloadCallback);
  }
  
  // 获取信息
  _getPackageInfo () async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    print(packageInfo.appName);
    print(packageInfo.buildNumber);
    print(packageInfo.packageName);
    print(packageInfo.version);

    // 临时目录
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    print(tempPath);
    // 应用安装目录
    Directory appDocDir = await getApplicationDocumentsDirectory();
    // 储存目录
    String appDocPath = appDocDir.path;
    print(appDocPath);

    // 可保存路径
    Directory directory = await getExternalStorageDirectory();
    print(directory.path);

    setState(() {
      _path = directory.path;
    });

  }

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Container(
        child: Center(
          child:Column(
            children: <Widget>[
              Visibility(
                visible: _show,
                child: Text('当前进度：$_progress'),
              ),
              RaisedButton(
                onPressed:() async{
                  setState(() {
                    _show = true;
                  });
                  final taskId = await FlutterDownloader.enqueue(
                    url: 'http://cdn.jahnli.cn/jdshop.apk',
                    // 保存路径
                    savedDir: _path,
                    // 是否通知栏显示进度
                    showNotification: true, // show download progress in status bar (for Android)
                    // 下载完成是否可以打开
                    openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                  );
                },
                child: Text('升级'),
              ),
            ],
          )
        ),
      ),
    );
  }
  




}