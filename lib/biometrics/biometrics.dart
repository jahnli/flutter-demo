import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/auth_strings.dart';

class Biometrics extends StatefulWidget {
  @override
  _BiometricsState createState() => _BiometricsState();
}

class _BiometricsState extends State<Biometrics> {

  final LocalAuthentication _auth = LocalAuthentication();

  @override
  void initState() { 
    super.initState();
    _checkAuth();
  }

  void _checkAuth() async{
    try{
      List<BiometricType> availableBiometrics  = await _auth.getAvailableBiometrics();
      print(availableBiometrics);
    }
    catch(e){
      print(e);
    }
  }

  @override
  void dispose() {
    _auth.stopAuthentication();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async{
                try {
                  bool didAuthenticate = await _auth.authenticateWithBiometrics(localizedReason: '请进行验证以便继续');
                  print(didAuthenticate);
                } catch (e) {
                  print(e);
                }
              },
              child: Text('指纹识别')
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () async{
                try {
                  const androidStrings = const AndroidAuthMessages(
                    cancelButton: '离开',
                    goToSettingsButton: '前往设置',
                    fingerprintNotRecognized:'指纹识别失败',
                    goToSettingsDescription: '请设置指纹',
                    fingerprintHint: '指纹认证',
                    fingerprintSuccess: '指纹认证成功',
                    signInTitle: '指纹验证',
                    fingerprintRequiredTitle: '请先录入指纹'
                  );
                  bool didAuthenticate = await _auth.authenticateWithBiometrics(localizedReason: '请进行验证以便继续',stickyAuth: true,useErrorDialogs: false, androidAuthStrings: androidStrings);
                  print(didAuthenticate);
                } catch (e) {
                  print(e);
                }
              },
              child: Text('自定义对话框消息')
            ),
          ],
        ),
      )
    );
  }
}