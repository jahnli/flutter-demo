import 'package:flutter/material.dart';

class AnimatedToggleButton extends StatefulWidget {
  @override
  AnimatedToggleButtonState createState() => AnimatedToggleButtonState();
}

class AnimatedToggleButtonState extends State<AnimatedToggleButton> {

  int _currentIndex = 1;
  double _currentLeft;
  double _currentWidth;
  double _currentHeight;

  final GlobalKey _notUsed = GlobalKey(debugLabel: 'notUsed');
  final GlobalKey _alireadyUsed = GlobalKey(debugLabel: 'alireadyUsed');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_onAfterRendering);
  }

  // 渲染完成之后的回调
  void _onAfterRendering(Duration timeStamp){
      RenderBox renderBox = _notUsed.currentContext.findRenderObject();
      double width = renderBox.size.width;  
      double height = renderBox.size.height;  
      double x = renderBox.localToGlobal(Offset.zero).dx;
      setState(() {
        _currentHeight = height;
        _currentWidth = width;
        _currentLeft = x;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(color: Colors.black,fontSize: 20)
        ),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        centerTitle: true,
        title: Text('AnimatedToggleButton'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _toggleWidget(),
        ],
      )
    );
  }

  Widget _ticketCard(){
    return Container(
    );
  }

  Widget _toggleWidget(){
    return Stack(
      children: <Widget>[
        AnimatedPositioned(
          left: _currentLeft,
          child: AnimatedContainer(
            width: _currentWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            duration: Duration(milliseconds: 500),
            height: _currentHeight,
          ),
          duration: Duration(milliseconds: 400),
        ),
        Positioned(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                key: _notUsed,
                onTap: (){
                  _setSize(_notUsed);
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                child: _toggleButton('NOT USED',1),
              ),
              SizedBox(width: 20),
              GestureDetector(
                key: _alireadyUsed,
                onTap: (){
                  _setSize(_alireadyUsed);
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                child: _toggleButton('ALREADY USED',2),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _toggleButton(String text,int index){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: AnimatedDefaultTextStyle(
        child: Text(text),
        curve: Curves.linear,
        style: TextStyle(color: _currentIndex == index ? Colors.white:Colors.black),
        duration: Duration(milliseconds: 500)
      ),
    );
  }

  void _setSize(key){
    if(mounted){
        RenderBox renderBox = key.currentContext.findRenderObject();
        double width = renderBox.size.width;  
        double height = renderBox.size.height;  
        double x = renderBox.localToGlobal(Offset.zero).dx;
        setState(() {
          _currentHeight = height;
          _currentWidth = width;
          _currentLeft = x;
        });
    }
  }

}