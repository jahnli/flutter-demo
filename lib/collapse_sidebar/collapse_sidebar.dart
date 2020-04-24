import 'package:flutter/material.dart';
class CollapseSideBar extends StatefulWidget {
  @override
  _CollapseSideBarState createState() => _CollapseSideBarState();
}

class _CollapseSideBarState extends State<CollapseSideBar> {

  List _lists = [
    {"title":'Dashboard',"icon":Icons.insert_chart},
    {"title":'Errors',"icon":Icons.error},
    {"title":'Search',"icon":Icons.search},
    {"title":'Notifications',"icon":Icons.notifications},
    {"title":'Settings',"icon":Icons.settings},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collapse SideBar'),
        backgroundColor: Color(0xff272d34),
      ),
      drawer: _collapseSideBar(),
      body: Container(),
    );
  }

  Widget _collaspeListItem(String title,IconData icon){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      child: Row(
        children: <Widget>[
          Icon(icon,color: Colors.white30),
          SizedBox(width: 30),
          Text(title,style: TextStyle(color: Colors.white70),)
        ],
      ),
    );
  }

  Widget _collapseSideBar(){
    return Container(
      color: Color(0xff272d34),
      // 0xff4ac8ea
      width: 200,
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          _collaspeListItem('Search Pulson',Icons.people),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context,index){
                return _collaspeListItem(_lists[index]['title'],_lists[index]['icon']);
              },
              itemCount: _lists.length,
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child:GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:  Icon(Icons.arrow_back_ios,color: Colors.white30),
            )
          )
        ],
      ),
    );
  }


}



