import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import './systspcdetail.dart';

void main() {
  runApp(new MaterialApp(
    title: "DB Admin",
    home: new Home(),
  ));
}

String url = "http://mam.epizy.com/dbapps/systblspctoday.php";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getssystblspce() async {
    final res = await http.get(url);
    return json.decode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("DB Admin"),
        ),
        body: new FutureBuilder<List>(
          future: getssystblspce(),
          builder: (context, sn) {
            if (sn.hasError) print(sn.error);

            return sn.hasData
                ? new ItemList(
                    list: sn.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ));
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new SysTSpcDetail(list: list,index: i,)
              )
            ),
            child: new Column(
              children: <Widget>[
                  new ListTile(
                title: new Text("Table Space SYSTEM"),
                leading: new Icon(Icons.storage),
                subtitle: new Text("${list[i]['percentage_used']}%"),
              ),
              ], 
            ),
          ),
        );
      },
    );
  }
}
