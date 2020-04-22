import 'package:flutter/material.dart';
import 'package:flutter_demo/flight_tickets/custom_shapeclipper.dart';

class FlightList extends StatefulWidget {

  final String t;
FlightList({this.t});

  @override
  _FlightListState createState() => _FlightListState();
}

class _FlightListState extends State<FlightList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search List'),
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade200,Colors.orange.shade700]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            _flightListTopPart(),
            SizedBox(height:30),
            _flightListBottomPart()
          ],
        ),
      )
    );
  }

  Widget _flightListBottomPart(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text('Best Deals for Next 6 Months',style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height:30),
          ListView(
            shrinkWrap: true,
            physics:ClampingScrollPhysics(),
            children: <Widget>[
              _flightCard(),
              _flightCard(),
              _flightCard(),
              _flightCard(),
              _flightCard(),
              _flightCard(),
            ],
          )
          
        ],
      ),
    );
  }
  Widget _flightCard(){
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('￥156',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  SizedBox(width: 15),
                  Text('( ￥200 )',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey,decoration: TextDecoration.lineThrough)),
                ],
              ),
              SizedBox(height:10),
              Wrap(
                spacing: 8,
                children: <Widget>[
                  _rawClip(Icons.calendar_today,'June 2020'),
                  _rawClip(Icons.flight_takeoff,'Jet Ariways'),
                  _rawClip(Icons.star,'June 4.4'),
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 10,
          child:Container(
            padding: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Text('55%',style: TextStyle(color: Colors.orange)),
          ),
        ),
      ],
    );
  }

  Widget _rawClip(IconData icon,String label){
    return RawChip(
      label: Text(label),
      avatar: Icon(icon,size: 16,),
    );
  }

  Widget _flightListTopPart(){
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade200,Colors.orange.shade700]
              )
            ),
            height: 260,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.symmetric(horizontal:20,vertical: 22.0),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('家私为家私私家私家私私',style: TextStyle(fontSize: 20)),
                          Divider(color: Colors.grey,height: 20,),
                          Text('牛妖可',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Icon(Icons.import_export,size:40),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

}