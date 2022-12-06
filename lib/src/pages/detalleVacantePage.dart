import 'package:flutter/material.dart';

import 'package:empleo_jah/src/pages/VistaAdminPage.dart';
import 'package:empleo_jah/src/pages/EditarVacantePage.dart';

import 'package:http/http.dart' as http;

class DetallesVacante extends StatefulWidget {
//Arreglo
  List lista;
  int index;

  DetallesVacante({this.index, this.lista});
  @override
  State<DetallesVacante> createState() => _DetallesVacanteState();
}

class _DetallesVacanteState extends State<DetallesVacante> {
  void deleteData() {
    var url = "http://192.168.137.107/empleo/deletevacante.php";
    http.post(url, body: {'id': widget.lista[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.all(15),
      elevation: 20,
      content: new Text(
          "Esta seguto de eliminar '${widget.lista[widget.index]['empresa']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "Eliminar",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VistaAdminPage(),
                ));
          },
        ),
        new RaisedButton(
          child:
              new Text("CANCELAR", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

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
        child: Center(
          child: Column(
            children: <Widget>[
              Image.network(
                widget.lista[widget.index]['image'],
                fit: BoxFit.cover, // Fixes border issues
                width: 200,
                height: 200,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                title: Text(
                  "Titulo: " + widget.lista[widget.index]['titulo'] + "\n",
                  style:
                      new TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                subtitle: Text(
                  "Descripcion: " +
                      widget.lista[widget.index]['descricion'] +
                      "\n" +
                      "\n" +
                      "Empresa: " +
                      widget.lista[widget.index]['empresa'] +
                      "\n" +
                      "Telefono: " +
                      widget.lista[widget.index]['telefono'] +
                      "\n" +
                      "Correo: " +
                      widget.lista[widget.index]['correo'] +
                      "\n" +
                      "Dirección: " +
                      widget.lista[widget.index]['direccion'] +
                      "\n" +
                      "RH: " +
                      widget.lista[widget.index]['nombrerh'] +
                      "\n",
                  style:
                      new TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 100.0,
                    elevation: 10,
                    height: 30.0,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditarVacantePage(
                          lista: widget.lista,
                          index: widget.index,
                        ),
                      ),
                    ),
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
                    onPressed: () => confirm(),
                    color: Colors.red[400],
                    child: Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    minWidth: 100.0,
                    elevation: 10,
                    height: 30.0,
                    child: new Text(
                      "Salir",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
