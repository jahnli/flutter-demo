import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class LiveStream extends StatefulWidget {
  @override
  _LiveStreamState createState() => _LiveStreamState();
}


class _LiveStreamState extends State<LiveStream> {

  IjkMediaController _controller = IjkMediaController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('直播')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await _controller.setNetworkDataSource('http://vfx.mtime.cn/Video/2019/03/18/mp4/190318231014076505.mp4',autoPlay: true);
          print("set data source success");
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Container(
        child: IjkPlayer(
          mediaController: _controller,
        ),
      )
    );
  }
}