import 'package:empleo_jah/src/pages/detalleVacantePage.dart';
import 'package:empleo_jah/src/pages/agregarVacantePage.dart';
import 'package:empleo_jah/src/pages/loginpage.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class VistaAdminPage extends StatefulWidget {
  @override
  _VistaAdminPageState createState() => _VistaAdminPageState();
}

class _VistaAdminPageState extends State<VistaAdminPage> {
  //Metodo que llama el get de vacante
  Future<List> obtenerVacante() async {
    final response = await http.get('http://192.168.0.108/empleo/getdata1.php');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bolsa de Empleo UT-Tlaxcala'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: obtenerVacante(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ElementoLista(
                  lista: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (BuildContext context) => new AgregarVacante()),
        ),
      ),
    );
  }
}

class ElementoLista extends StatelessWidget {
  final List lista;

  ElementoLista({this.lista});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lista == null ? 0 : lista.length,
        itemBuilder: (context, posicion) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetallesVacante(
                          lista: lista,
                          index: posicion,
                        )),
              ),
              child: Card(
                color: Colors.lightGreen,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                elevation: 10,
                child: new Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    lista[posicion]['id'] + ": " + lista[posicion]['empresa'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
