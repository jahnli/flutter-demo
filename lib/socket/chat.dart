import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  List _list = [];
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('聊天室')),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            controller: _controller,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(_list[index]['title']),
                subtitle: Text('${_list[index]['time']}'),
              );
            },
            itemCount: _list.length,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10,left: 10,right:10),
                              border: InputBorder.none
                            )
                          ),
                        ),
                      ),
                      Icon(Icons.insert_emoticon,color: Colors.grey),
                      SizedBox(width: 10),
                      Icon(Icons.add_circle,color: Colors.grey),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[Colors.orange.shade200,Colors.orange.shade300]
                )
              ),
            )
          )
        ],
      ),
    );
  }
}