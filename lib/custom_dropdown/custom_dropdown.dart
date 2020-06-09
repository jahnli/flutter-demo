import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  String _text;
  bool _isOpen = false;
  GlobalKey _actionKey;
  double _width;
  double _height;
  double _x;
  double _y;
  OverlayEntry _floatDropdown;

  @override
  void initState() { 
    super.initState();
    _actionKey = LabeledGlobalKey(_text);
  }

  
  @override
  void dispose() {
    _floatDropdown.remove();
    super.dispose();
  }

  OverlayEntry _createFloatDropdown(){
    return OverlayEntry(
      builder: (context){
        return Positioned(
          left: _x,
          top: _y  + _height + 5,
          width: _width,
          height: 4 * _height + 20,
          child: Dropdown(itemHeight: _height)
        );
      }
    );
  }
  

  void _findDropdown(){
    RenderBox renderBox = _actionKey.currentContext.findRenderObject();
    _width = renderBox.size.width;
    _height = renderBox.size.height;
    _x = renderBox.localToGlobal(Offset.zero).dx;
    _y = renderBox.localToGlobal(Offset.zero).dy;
    print('$_width , $_height  , $_x  , $_y');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          key:_actionKey,
          onTap: (){
            if(_isOpen){
              _floatDropdown.remove();
            }else{
              _findDropdown();
              _floatDropdown =  _createFloatDropdown();
              Overlay.of(context).insert(_floatDropdown);
            }
            setState(() {
              _isOpen = !_isOpen;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
            decoration: BoxDecoration(
              color: Colors.red.shade200,
              borderRadius: BorderRadius.circular(3)
            ),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              children: [
                Text('Call to Action'.toUpperCase(),style: TextStyle(color: Colors.white),),
                Spacer(),
                Icon(Icons.arrow_drop_down,color: Colors.white,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Dropdown extends StatelessWidget {
  final double itemHeight;
  const Dropdown({Key key, this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Container(
          alignment: Alignment(-0.8,1),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              width: 20,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.red.shade200
              ),
            ),
          ),
        ),
        Container(
          height: 4 * itemHeight,
          child: Column(
            children: [
              _item(),
              _item(),
              _item(),
              _item(),
            ],
          ),
        )
      ],
    );
  }

  Widget _item(){
    return Material(
      elevation: 10,
      child: Container(
        height: itemHeight,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.red.shade200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Jahn',style: TextStyle(color: Colors.white,fontSize: 16)),
            Icon(Icons.arrow_drop_down,color: Colors.white,)
          ],
        )
      ),
    );
  }

}



class ArrowClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
 