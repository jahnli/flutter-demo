import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDemo extends StatefulWidget {
  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {

  var _img;

  // 拍摄图片
  void _takeImage()async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera,maxWidth: 450);
    print(image);
    setState(() {
      _img = image;
    });
  }

  // 相册选择
  void _openGallery() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery,maxWidth: 450);
    setState(() {
      _img = image;
    });
    print(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('image_picker')),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _img == null
            ? Text('No image selected.')
            : Image.file(_img),
            RaisedButton(
              onPressed:()=>_takeImage(),
              child: Text('拍摄'),
            ),
            RaisedButton(
              onPressed:()=>_openGallery(),
              child: Text('相册选择'),
            ),
          ],
        ),
      )
    );
  }
}