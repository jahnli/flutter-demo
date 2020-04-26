import 'package:flutter/material.dart';

class AnimationCarouse extends StatefulWidget {
  @override
  _AnimationCarouseState createState() => _AnimationCarouseState();
}

class _AnimationCarouseState extends State<AnimationCarouse> {

  final imgs = [
    'assets/images/animation_carouse/one.jpg',
    'assets/images/animation_carouse/two.jpg',
    'assets/images/animation_carouse/three.jpg',
  ];
  final colorList = [
    Colors.pinkAccent.shade100,
    Colors.blueAccent.shade100,
    Colors.amber.shade100,
  ];

  final _detailList = [
    {"title":'Fluter',"desc":'Google 开源的 UI 工具包，帮助开发者通过一套代码库高效构建多平台精美应用'},
    {"title":'Vue',"desc":'一套构建用户界面的渐进式框架'},
    {"title":'Node',"desc":'Node.js 是一个基于 Chrome V8 引擎的 JavaScript 运行环境。'},
  ];

  int _currentPage = 0;
  GlobalKey _titleKey = GlobalKey();
  PageController _pageController;
  double _titleWidth = 65;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.8,
      keepPage: true
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Carouse')),
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: colorList[_currentPage],
          ),
          Column(
            children: <Widget>[
              Container(
                height: 500,
                width: 400,
                child: PageView.builder(
                  onPageChanged: (val){
                    setState(() {
                      _currentPage = val;
                    });
                    WidgetsBinding.instance.addPostFrameCallback((val){
                      RenderBox renderBox = _titleKey.currentContext.findRenderObject();
                      setState(() {
                        _titleWidth = renderBox.size.width;
                      });
                    });
                  },
                  controller: _pageController,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index){
                    return Column(
                      children: <Widget>[
                        _item(index)
                      ],
                    );
                  },
                  itemCount: 3,
                ),
              ),
              _detail()
            ],
          )
        ],
      )
    );
  }

  Widget _detail(){
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context,child){
        double _val = 1;
        if(_pageController.position.haveDimensions){
          _val = _pageController.page - _currentPage;
          _val = (1 - (_val.abs() * 0.5).clamp(0,1));
        }
        return Transform.translate(
          offset: Offset(0, (-_val * 300) + 300),
          child: Opacity(
            opacity: _val,
            child: Column(
              children: <Widget>[
                Text(
                  _detailList[_currentPage]['title'],
                  key:_titleKey,
                  style: TextStyle(fontSize: 30)
                ),
                SizedBox(height: 20),
                Container(
                  width: _titleWidth,
                  color: Colors.black,
                  height: 3,
                ),
                SizedBox(height: 20),
                Text(_detailList[_currentPage]['desc'],style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _item(int index){
    return AnimatedBuilder(
      animation:_pageController,
      builder: (context,child){
        double val = 1;
        if(_pageController.position.haveDimensions){
          val = _pageController.page - index;
          val = (1 - (val.abs() * 0.5).clamp(0,1));
        }
        return Container(
          height: _pageController.position.haveDimensions ? Curves.easeIn.transform(val) * 400 : Curves.easeIn.transform(index == 0 ? val : val * 0.5) * 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
            ),
            color:Colors.white
          ),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: child,
        );
      },
      child: ClipRRect(
        borderRadius:BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
        ),
        child: Image.asset(imgs[index],fit: BoxFit.fitHeight,),
      ),
    );
  }

}