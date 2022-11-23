import 'package:empleo_jah/src/pages/detail.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class VistaHoracio extends StatefulWidget {
  @override
  State<VistaHoracio> createState() => _VistaHoracioState();
}

class _VistaHoracioState extends State<VistaHoracio> {
  Future<List> getData() async {
    final response = await http.get('http://192.168.0.105/empleo/getdata.php');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bolsa de Empleo UT-Tlaxcala'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          /*  Navigator.push(
              context, MaterialPageRoute(builder: (context) => addData())); */
        },
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detail(
                        list: list,
                        index: i,
                      )),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                title: Text(
                  list[i]['username'],
                  style: TextStyle(fontSize: 25.0),
                ),
                leading: Icon(
                  Icons.person,
                  size: 77.0,
                  color: Colors.orangeAccent,
                ),
                subtitle: Text(
                  "Role : ${list[i]['role']}",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
