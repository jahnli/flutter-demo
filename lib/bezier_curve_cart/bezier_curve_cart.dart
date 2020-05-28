import 'package:flutter/material.dart';
import 'package:flutter_demo/bezier_curve_cart/red_dot.dart';

class BezierCurveCart extends StatefulWidget {
  @override
  _BezierCurveCartState createState() => _BezierCurveCartState();
}

class _BezierCurveCartState extends State<BezierCurveCart>{

  final GlobalKey _key = GlobalKey(debugLabel: 'cartkey');
  Offset _cartOffest;
  @override
  void initState() { 
    super.initState();
    // 第一帧之后获取购物车图标位置
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartOffest  = (_key.currentContext.findRenderObject() as RenderBox).localToGlobal(Offset.zero);
      print(_cartOffest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemBuilder: (context,index){
                  return Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                         Text('商品  $index'),
                         Builder(
                          builder: (BuildContext context){
                            return IconButton(
                              icon:Icon(Icons.add_circle_outline,size: 20),
                              onPressed: (){
                                // 因为没有Builder的context表示当前整个控件的context，其上并没有NotificationListener监听，而加上Builder后，context表示Builder控件，其上有NotificationListener监听
                                // 通过 Builder 组件来获取 context
                                RenderBox box = context.findRenderObject();
                                Offset offset = box.localToGlobal(Offset.zero);
                                print(offset);
                                 // 点击的时候获取当前 widget 的位置，传入 overlayEntry
                                OverlayEntry _overlayEntry =  OverlayEntry(
                                   builder: (context) {
                                    return RedDot(offset,_cartOffest);
                                  }
                                );
                                // 显示Overlay
                                Overlay.of(context).insert(_overlayEntry);
                                // 清除
                                Future.delayed(Duration(milliseconds: 800), () {
                                  _overlayEntry.remove();
                                  _overlayEntry = null;
                                });
                              },
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
                itemCount: 40,
              ),
            )
          ),
          Divider(
            height: 4,
            color: Colors.grey,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.add_shopping_cart,
              key:_key
            ),
          )
        ],
      )
    );
  }
}