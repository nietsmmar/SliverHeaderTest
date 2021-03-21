import 'package:flutter/material.dart';

class DashboardBarButton extends StatefulWidget {
  final String _title;
  Function _callback;
  bool pressed = false;

  DashboardBarButton(this._title, this._callback, {this.pressed, Key key}) : super(key: key);

  @override
  _DashboardBarButtonState createState() => new _DashboardBarButtonState();
}

class _DashboardBarButtonState extends State<DashboardBarButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          highlightColor: Theme.of(context).primaryColor.withOpacity(0.2),
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              alignment: Alignment.center,
              child: Text(widget._title,
                  style: TextStyle(color: widget.pressed ? Color.fromRGBO(237, 83, 56, 1) : Colors.black, fontWeight: FontWeight.w500)),
            ),
            onTap: () {
              setState(() {
                widget.pressed = !widget.pressed;
                widget._callback();
              });
            }));
  }
}
