import 'package:flutter/material.dart';
import 'package:flutter_demo/flight_tickets/custom_shapeclipper.dart';
import 'package:flutter_demo/flight_tickets/flight_list.dart';


class FlightTickets extends StatefulWidget {
  @override
  _FlightTicketsState createState() => _FlightTicketsState();
}

class _FlightTicketsState extends State<FlightTickets> {

  Color firstColor = Colors.orange.shade200;
  Color secondColor = Colors.red.shade400;

  ThemeData _appTheme = ThemeData(
    primaryColor: Color(0xfff3791a),
  );

  List<String> _locations = ['河南','苏州','北京','黑龙江'];
  int _currentLocation = 0;
  bool _isFlight = true;

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home),title: Text('Home')),
          BottomNavigationBarItem(icon:Icon(Icons.favorite),title: Text('WatchList')),
          BottomNavigationBarItem(icon:Icon(Icons.local_offer),title: Text('Deals')),
          BottomNavigationBarItem(icon:Icon(Icons.notifications),title: Text('Notifications')),
        ],
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _screenTopUi(),
            ],
          ),
          _screenBottomUi()
        ],
      ),
    );
  }

  Widget _screenBottomUi(){
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 30),
              Text('Currently Watched Items',textAlign: TextAlign.left,style: TextStyle(fontSize: 20)),
              SizedBox(width: 10),
              Text('View All (12)',style: TextStyle(color: Colors.orange,fontSize: 20))
            ],
          ),
          SizedBox(height:20),
          Container(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _cityCard('assets/images/flight_tickets/athens.jpg','家私威嘎斯','Feb 2020','45','666','2680'),
                _cityCard('assets/images/flight_tickets/lasvegas.jpg','阿买瑞肯','Feb 2021','33','455','5113'),
                _cityCard('assets/images/flight_tickets/sydney.jpeg','牛妖可','Feb 2019','30','544','2135'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _cityCard(String imagePath,String cityName,String monthYear,String discount,String oldPrice,String newPrice){
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 240,
                    width: 180,
                    child: Image.asset(imagePath,fit: BoxFit.cover,)
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 10,
                width: 180,
                height: 70,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54,Colors.black12]
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 10,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(cityName,style: TextStyle(color: Colors.white,fontSize: 20)),
                        Text(monthYear,style: TextStyle(color: Colors.white,fontSize: 16)),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:15,vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Text('$discount%',style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _screenTopUi(){
    return ClipPath(
      clipper: CustomShapeClipper(),
      child:  Container(
        height: 400,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[firstColor,secondColor]
          )
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(20,40,20,40),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.location_on,size: 40,color: Colors.white),
                  SizedBox(width: 15),
                  PopupMenuButton(
                    onSelected: (val){
                      if(_currentLocation != val){
                        setState(() {
                          _currentLocation = val;
                        });
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return  _locations.asMap().keys.map<PopupMenuEntry<dynamic>>((val){
                        return  PopupMenuItem<int>(child: Text(_locations[val]),value:val);
                      }).toList();
                    },
                    child: Row(
                      children: <Widget>[
                        Text(_locations[_currentLocation],style: TextStyle(color: Colors.white,fontSize: 25)),
                        Icon(Icons.arrow_drop_down,size: 60,color: Colors.white,)
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.settings,color: Colors.white,size: 40,)
                ],
              ),
              SizedBox(height: 30),
              Text('歪儿阿尤腐软木\n集美们',style: TextStyle(color: Colors.white,fontSize: 30)),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white
                ),
                child: TextField(
                  controller: TextEditingController(
                    text: _locations[0],
                  ),
                  cursorColor:_appTheme.primaryColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 35,vertical: 14),
                    border: InputBorder.none,
                    suffixIcon: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(30),
                      child: GestureDetector(
                        onTap:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => FlightList(t:'xx')));
                        },
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _chooseChip('Flights',_isFlight),
                  SizedBox(width:20),
                  _chooseChip('Hotels',!_isFlight),
                ],
              )
            ],
          ),
        ),
      ),
    ); 
  }

  Widget _chooseChip(text,isFlight){
    return GestureDetector(
      onTap: (){
        setState(() {
          _isFlight = !_isFlight;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        decoration: BoxDecoration(
          color: isFlight ? Colors.white.withOpacity(0.15):null,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: <Widget>[
            Icon(Icons.flight_takeoff,size: 30,color: Colors.white),
            SizedBox(width: 10),
            Text(text,style: TextStyle(color: Colors.white,fontSize: 20))
          ],
        ),
      ),
    );
  }

}