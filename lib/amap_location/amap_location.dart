import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';

class AmapLocation extends StatefulWidget {
  @override
  _AmapLocationState createState() => _AmapLocationState();
}

class _AmapLocationState extends State<AmapLocation> {

  var _result;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init ()async{
     await AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters  ));
     var result =  await AMapLocationClient.getLocation(true);
     setState(() {
       _result = result;
     });
     print(result.city);
     print(result.longitude);
     print(result.latitude);
  }

  @override
  void dispose() {
    //注意这里关闭
    AMapLocationClient.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('amap_location'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('城市：${_result?.city}'),
            Text('经度：${_result?.longitude}'),
            Text('经度：${_result?.latitude}'),
          ],
        ),
      ),
    );
  }
}