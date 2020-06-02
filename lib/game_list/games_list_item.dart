import 'package:flutter/material.dart';
import 'package:flutter_demo/game_list/custom_progress.dart';
class GamesListItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double progress;
  final double screenWidth;

  const GamesListItem({Key key, @required this.image, this.title = '', this.description = '', this.progress = 1.0, this.screenWidth}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:15),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  child:Image.network(image,width: 100,fit:BoxFit.cover),
                  borderRadius: BorderRadius.circular(3),
                ),
                SizedBox(width: 20),
                Container(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('$title',style: TextStyle(fontSize: 20)),
                      Text('$description',style: TextStyle(fontSize: 14,color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomProgress(progress: progress,screenWidth:screenWidth)
          )
        ],
      ),
    );
  }
}