import 'package:flutter/material.dart';
import 'package:awsome_video_player/awsome_video_player.dart';

class LiveStream extends StatefulWidget {
  @override
  _LiveStreamState createState() => _LiveStreamState();
}


class _LiveStreamState extends State<LiveStream> {

  String mainSubtitles = "主字幕";
  String subSubtitles = "辅字幕";


  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init()async{
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('直播')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
        },
        child: Icon(Icons.play_arrow),
      ),
      body:  Center(
        child: AwsomeVideoPlayer(
          "https://www.runoob.com/try/demo_source/movie.mp4",
          /// 视频播放配置
          playOptions: VideoPlayOptions(
            seekSeconds: 30,
            aspectRatio: 16 / 9,
            loop: true,
            autoplay: true,
            allowScrubbing: true,
            startPosition: Duration(seconds: 0)),
          /// 自定义视频样式
          videoStyle: VideoStyle(
            /// 自定义视频暂停时视频中部的播放按钮
            playIcon: Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            ),
            /// 暂停时是否显示视频中部播放按钮
            showPlayIcon: true,
            /// 自定义底部控制栏
            videoControlBarStyle: VideoControlBarStyle(
              /// 自定义颜色
              //barBackgroundColor: Colors.blue,
              /// 自定义进度条样式
              progressStyle: VideoProgressStyle(
                // padding: EdgeInsets.all(0),
                playedColor: Colors.red,
                bufferedColor: Colors.yellow,
                backgroundColor: Colors.green,
                dragBarColor: Colors.white,//进度条为`progress`时有效，如果时`basic-progress`则无效
                height: 4,
                progressRadius: 2,//进度条为`progress`时有效，如果时`basic-progress`则无效
                dragHeight: 5//进度条为`progress`时有效，如果时`basic-progress`则无效
              ),
              /// 更改进度栏的播放按钮
              playIcon: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 16
              ),
              /// 更改进度栏的暂停按钮
              pauseIcon: Icon(
                Icons.pause,
                color: Colors.red,
                size: 16,
              ),
              /// 更改进度栏的快退按钮
              rewindIcon: Icon(
                Icons.replay_30,
                size: 16,
                color: Colors.white,
              ),
              /// 更改进度栏的快进按钮
              forwardIcon: Icon(
                Icons.forward_30,
                size: 16,
                color: Colors.white,
              ),
              /// 更改进度栏的全屏按钮
              fullscreenIcon: Icon(
                Icons.fullscreen,
                size: 16,
                color: Colors.white,
              ),
              /// 更改进度栏的退出全屏按钮
              fullscreenExitIcon: Icon(
                Icons.fullscreen_exit,
                size: 16,
                color: Colors.red,
              ),
              /// 决定控制栏的元素以及排序，示例见上方图3
              itemList: [
                "rewind",
                "play",
                "forward",
                "position-time", //当前播放时间
                "progress",//线形进度条
                //"basic-progress",//矩形进度条
                "duration-time", //视频总时长
                // "time", //格式：当前时间/视频总时长
                "fullscreen"
              ],
            ),
            /// 自定义字幕
            videoSubtitlesStyle: VideoSubtitles(
              mianTitle: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                  child: Text(
                      mainSubtitles,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 14)),
                ),
              ),
              subTitle: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      subSubtitles,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 14)),
                ),
              ),
            ),
          ),
          /// 自定义拓展元素
          children: [
            /// 这个将会覆盖的视频内容，因为这个层级是最高级，因此手势会失效(慎用)
            /// 这个可以用来做视频广告
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   bottom: 0,
            //   right: 0,
            //   child: Text("data", style: TextStyle(color: Colors.white),),
            // ),
          ],
          /// 视频初始化完成回调
          oninit: (controller) {
            print("video oninit");
          },
          /// 视频播放回调
          onplay: (value) {
            print("video played");
          },
          /// 视频暂停回调
          onpause: (value) {
            print("video paused");
          },
          /// 视频播放结束回调
          onended: (value) {
            print("video ended");
          },
          /// 视频播放进度回调
          /// 可以用来匹配字幕
          ontimeupdate: (value) {
            print("timeupdate $value");
            var position = value.position.inMilliseconds / 1000;
            //根据 position 来判断当前显示的字幕
          },
          /// 声音变化回调
          onvolume: (value) {
            print("onvolume $value");
          },
          /// 亮度变化回调
          onbrightness: (value) {
            print("onbrightness $value");
          },
          /// 网络变化回调
          onnetwork: (value) {
            print("onbrightness $value");
          },
          /// 顶部控制栏点击返回按钮
          onpop: (value) {
            print("返回上一页");
          },
        ),
      ),
    );
  }
}