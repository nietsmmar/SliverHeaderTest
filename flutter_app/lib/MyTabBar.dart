import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DashboardBarButton.dart';

class MyTabBar extends StatefulWidget {
  Function _trendingPressed;
  Function _explorePressed;
  bool _trending;
  double _height;

  MyTabBar(this._trending, this._height, this._trendingPressed, this._explorePressed, {Key key}) : super(key: key);

  @override
  _MyTabBarState createState() => new _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.transparent,
      duration: Duration(seconds: 800),
      height: widget._height,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Expanded(
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                DashboardBarButton(
                  "Button1",
                  widget._trendingPressed,
                  pressed: widget._trending,
                ),
                widget._trending
                    ? Container(
                        color: Theme.of(context).primaryColor,
                        height: 5,
                      )
                    : Container(height: 5)
              ]))
            ],
          )),
          VerticalDivider(width: 1),
          Expanded(
              child: Column(
            children: <Widget>[
              Expanded(
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                DashboardBarButton(
                  "Button2",
                  widget._explorePressed,
                  pressed: !widget._trending,
                ),
                !widget._trending ? Container(color: Theme.of(context).primaryColor, height: 5) : Container(height: 5)
              ]))
            ],
          ))
        ],
      ),
    );
  }
}
