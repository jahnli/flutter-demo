import 'package:flutter/material.dart';
enum ButtonState{
  SHOW_ONLY_TEXT,
  SHOW_ONLY_ICON,
  SHOW_TEXT_ICON
}

class AnimationButton extends StatefulWidget {
  @override
  _AnimationButtonState createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton> with TickerProviderStateMixin {

  AnimationController _animationController;
  ButtonState _currentState;
  

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000)
    );
    _currentState = ButtonState.SHOW_ONLY_TEXT;
    _animationController.addListener((){
      double _val = _animationController.value;
      if( _val < 0.2 ){
        setState(() {
          _currentState = ButtonState.SHOW_ONLY_ICON;
        });
      }else if(_val > 0.8){
        setState(() {
          _currentState = ButtonState.SHOW_TEXT_ICON;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:_animationButton()
      ),
    );
  }

  Widget _animationButton(){
    return GestureDetector(
      onTap:(){
        _animationController.forward();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: _currentState == ButtonState.SHOW_ONLY_ICON ? 13:30,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:( _currentState == ButtonState.SHOW_ONLY_ICON || _currentState == ButtonState.SHOW_TEXT_ICON) ? null : Colors.green.shade400,
          border: Border.all(
            color: (_currentState == ButtonState.SHOW_ONLY_ICON || _currentState == ButtonState.SHOW_TEXT_ICON) ? Colors.green.shade400 :  Colors.transparent
          )
        ),
        child: AnimatedSize(
          duration: Duration(milliseconds:500), 
          vsync: this,
          curve: Curves.easeIn,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              (_currentState == ButtonState.SHOW_ONLY_ICON || _currentState == ButtonState.SHOW_TEXT_ICON) ? Icon(Icons.done,color: (_currentState == ButtonState.SHOW_TEXT_ICON || _currentState == ButtonState.SHOW_ONLY_ICON)  ? Colors.green.shade400:Colors.white):Container(),
              SizedBox(width: _currentState == ButtonState.SHOW_TEXT_ICON ? 15:0),
              (_currentState == ButtonState.SHOW_ONLY_TEXT || _currentState == ButtonState.SHOW_TEXT_ICON) ? 
              Text(_getText(),style: TextStyle(color: _currentState == ButtonState.SHOW_TEXT_ICON  ? Colors.green.shade400:Colors.white,fontSize: 20))
              :Container()
            ],
          ),
        )
      ),
    );
  }

  String _getText(){
    Map type = {
      ButtonState.SHOW_ONLY_ICON:'',
      ButtonState.SHOW_ONLY_TEXT:'Confim',
      ButtonState.SHOW_TEXT_ICON:'Submited',
    };
    return type[_currentState];
  }

}