import 'package:flutter/material.dart';

class ContextHeading extends StatelessWidget {
  final String heading;
  const ContextHeading({Key key,@required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(heading,style: TextStyle(fontSize: 22),),
    );
  }
}