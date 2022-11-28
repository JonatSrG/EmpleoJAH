import 'package:empleo_jah/src/pages/vistaHoracio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  //TextEditingController controllerRole = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void addData() {
    var url = "http://192.168.0.108/empleo/adddata.php";

    http.post(url, body: {
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "role": _mySelection
          .toString(), //aqui traemos el DropdownMenuItem lo llamamos _mySelection este es como el controller
      //"nivel": controllerNivel.text
    });
  }

  String _mySelection;
  List<Map> _myJson = [
    {"id": 0, "name": "Alumno"},
    {"id": 1, "name": "Admin"},
    {"id": 2, "name": "Vista"},
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Nuevo Usuario"),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.orange),
                    title: new TextFormField(
                      controller: controllerUsername,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Ingresa un nombre de usuario";
                      },
                      decoration: new InputDecoration(
                        hintText: "Usuario",
                        labelText: "Usuario",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading:
                        const Icon(Icons.location_on, color: Colors.orange),
                    title: new TextFormField(
                      controller: controllerPassword,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una Contraseña";
                      },
                      decoration: new InputDecoration(
                        hintText: "Contraseña",
                        labelText: "Contraseña",
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: Icon(
                          Icons.list,
                          color: Colors.orange,
                        ),
                      ),
                      VerticalDivider(
                        width: 40.0,
                      ),
                      new Container(
                        //margin: EdgeInsets.only(right: 80.0),
                        height: 50.0,
                        width: 100.0,
                        child: new DropdownButton<String>(
                          isDense: true,
                          hint: new Text("Role"),
                          iconSize: 40.0,
                          elevation: 10,
                          value: _mySelection,
                          onChanged: (String newValue) {
                            setState(() {
                              _mySelection = newValue;
                            });
                            print(_mySelection);
                          },
                          items: _myJson.map((Map map) {
                            return new DropdownMenuItem<String>(
                              //value: map["id"].toString(),
                              value: map["name"].toString(),
                              child: new Text(
                                map["name"],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(30.0),
                  ),
                  new RaisedButton(
                    child: new Text("Agregar"),
                    color: Colors.green,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addData();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VistaHoracio()));
                      }
                    },
                  ),
                  new RaisedButton(
                    child: new Text("Salir"),
                    color: Colors.orange,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
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
