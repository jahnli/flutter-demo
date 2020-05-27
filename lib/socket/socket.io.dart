import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIo extends StatefulWidget {
  @override
  _SocketIoState createState() => _SocketIoState();
}

class _SocketIoState extends State<SocketIo> {

  IO.Socket socket;
  List _log = [];
  ScrollController _controller = ScrollController();

  @override
  void initState() { 
    super.initState();
    _init();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _init(){
    // 建立链接
    socket = IO.io('http://192.168.43.76:3000', <String, dynamic>{
      'transports': ['websocket']
    });
    socket.on('connect', (_) {
      print('连接成功');
      setState(() {
        _log.add({
          "title":'连接成功',
          "time":new DateTime.now()
        });
      });
      socket.emit('send', '我发送数据了');
    });
    socket.on('getMsg', (data) {
      print('我是Flutter打印的' + data);
      setState(() {
        _log.add({
          "title":data,
          "time":new DateTime.now()
        });
      });
        _controller.jumpTo(_controller.position.maxScrollExtent);
    });
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          socket.emit('send', '我是flutter发出的数据');
        },
      ),
      body: Container(
        child: ListView.builder(
            controller: _controller,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(_log[index]['title']),
                subtitle: Text('${_log[index]['time']}'),
              );
            },
            itemCount: _log.length,
          )
      ),
    );
  }
}