import 'package:flutter/material.dart';
import 'package:flutter_demo/despicable_me/style_guide.dart';
import 'package:flutter_demo/flight_tickets/custom_shapeclipper.dart';


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
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
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
                                child: Icon(Icons.search),
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
              )
            ],
          )
        ],
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