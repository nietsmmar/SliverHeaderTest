import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TopBar extends AppBar {
  String _title;

  TopBar(String title) {
    this._title = title;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(34);

  @override
  Widget get title => Text(_title);

  @override
  List<Widget> get actions => <Widget>[];

  @override
  Color get backgroundColor => Colors.black87;

  @override
  // TODO: implement elevation
  double get elevation => 0;
}