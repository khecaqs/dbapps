import 'package:flutter/material.dart';

class SysTSpcDetail extends StatefulWidget {
  List list;
  int index;
  SysTSpcDetail({this.list, this.index});

  @override
  _SysTSpcDetailState createState() => new _SysTSpcDetailState();
}

class _SysTSpcDetailState extends State<SysTSpcDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
              "System Table Space ${widget.list[widget.index]['datecreate']}")),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    "Percent Use          ",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  new Text(
                    widget.list[widget.index]['percentage_used'],
                    style: new TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    "Space Allocated  ",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  new Text(
                    "${widget.list[widget.index]['space_allocated']}",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    "Space Used         ",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  new Text(
                    " ${widget.list[widget.index]['space_used']}",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    "Free Space          ",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  new Text(
                    " ${widget.list[widget.index]['space_free']}",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    "Bil. DataFile         ",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  new Text(
                    " ${widget.list[widget.index]['DATAFILES']}",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
