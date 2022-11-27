import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DetallesVacante extends StatefulWidget {
//Arreglo
  int index;
  List lista;

  DetallesVacante({this.index, this.lista});
  @override
  State<DetallesVacante> createState() => _DetallesVacanteState();
}

class _DetallesVacanteState extends State<DetallesVacante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la vacante'),
        automaticallyImplyLeading: false,
      ),
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        elevation: 10,
        child: Column(
          children: <Widget>[
            new Text(
              "ID Vacante: " + widget.lista[widget.index]['id'],
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            new Text(
              "Titulo: " + widget.lista[widget.index]['titulo'],
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            new Text(
              "Descripcion: " + widget.lista[widget.index]['descripcion'],
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            new Text(
              "Empresa: " + widget.lista[widget.index]['empresa'],
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            new Text(
              "Telefono: " + widget.lista[widget.index]['telefono'],
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            new Text(
              "Correo: " + widget.lista[widget.index]['correo'],
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            new Text(
              "Direccion: " + widget.lista[widget.index]['direccion'],
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  minWidth: 100.0,
                  elevation: 10,
                  height: 30.0,
                  onPressed: () {},
                  color: Colors.orange[400],
                  child: Text(
                    'Editar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  minWidth: 100.0,
                  elevation: 10,
                  height: 30.0,
                  onPressed: () {},
                  color: Colors.red[400],
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
