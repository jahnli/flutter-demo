import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/despicable_me/style_guide.dart';

class CharacterDetail extends StatefulWidget {
  int index;
  CharacterDetail(this.index);

  final double _expandedBottomSheet = 0;
  final double _collapseBottomSheet = -210;
  final double _completeBottomSheet = -330;

  @override
  _CharacterDetailState createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail>
    with AfterLayoutMixin {
  bool _isCollapsed = false;
  double _bottomPosition = -330;
  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _isCollapsed = true;
        _bottomPosition = widget._collapseBottomSheet;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      top: false,
      child: Container(
        child: Stack(fit: StackFit.expand, children: <Widget>[
          DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orange.shade200, Colors.orange.shade900],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft))),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _bottomPosition = widget._completeBottomSheet;
                          });
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 40,
                        )),
                    Container(
                        alignment: Alignment.topRight,
                        child: Hero(
                            tag: 'character',
                            child: Image.asset(
                                widget.index == 1
                                    ? 'assets/images/Kevin_minions.png'
                                    : 'assets/images/Agnes_gru.png',
                                height: screenHeight * 0.35))),
                    Text(
                      widget.index == 1 ? 'Hanson' : 'Jahn',
                      style: AppTheme.heading,
                    ),
                    Text('兄弟们冲 兄弟们冲 兄弟们兄弟们兄弟们冲', style: AppTheme.subHeading),
                    Text('鸡妹们', style: AppTheme.subHeading),
                  ]),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            bottom: _bottomPosition,
            curve: Curves.decelerate,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _bottomPosition = _isCollapsed 
                          ? widget._expandedBottomSheet
                          :widget._collapseBottomSheet;
                          
                          _isCollapsed = !_isCollapsed;
                        });
                      },
                      child:Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20),
                        height: 80,
                        child: Text('Clips',
                            style: AppTheme.subHeading
                                .copyWith(color: Colors.black)),
                      ),
                    ),
                    SingleChildScrollView(child: _clipsWidget())
                  ]),
            ),
          )
        ]),
      ),
    ));
  }

  Widget _clipsWidget() {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: <Widget>[
        Column(
          children: <Widget>[
            roundedContainer(Colors.redAccent),
            SizedBox(height: 20),
            roundedContainer(Colors.greenAccent)
          ],
        ),
        SizedBox(width: 16),
        Column(
          children: <Widget>[
            roundedContainer(Colors.redAccent),
            SizedBox(height: 20),
            roundedContainer(Colors.greenAccent)
          ],
        ),
        SizedBox(width: 16),
        Column(
          children: <Widget>[
            roundedContainer(Colors.redAccent),
            SizedBox(height: 20),
            roundedContainer(Colors.greenAccent)
          ],
        ),
        SizedBox(width: 16),
        Column(
          children: <Widget>[
            roundedContainer(Colors.redAccent),
            SizedBox(height: 20),
            roundedContainer(Colors.greenAccent)
          ],
        ),
        SizedBox(width: 16),
        Column(
          children: <Widget>[
            roundedContainer(Colors.redAccent),
            SizedBox(height: 20),
            roundedContainer(Colors.greenAccent)
          ],
        ),
        SizedBox(width: 16)
      ]),
    );
  }

  Widget roundedContainer(Color color) {
    return Container(
      width: 86,
      height: 80,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
  }
}
