import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: "DB Admin",
    home: new home(),
  ));
}

String url = "http://mam.epizy.com/dbapps/systblspctoday.php";

class home extends StatefulWidget {
  @override
  _homeState createState() => new _homeState();
}

class _homeState extends State<home> {
  Future<List> getData() async {
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
          future: getData(),
          builder: (context, sn) {
            if (sn.hasError) print(sn.error);

            return sn.hasData
                ? ItemList(
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
            onTap: () {},
            child: new Card(
              child: new ListTile(
                title: new Text("Table Space SYSTEM"),
                leading: new Icon(Icons.storage),
                subtitle: Text("${list[i]['percentage_used']}%"),
              ),
            ),
          ),
        );
      },
    );
  }
}
