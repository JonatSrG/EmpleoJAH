import 'package:empleo_jah/src/pages/vistaHoracio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerUsername;
  TextEditingController controllerPassword;
  TextEditingController controllerRole;

  void dataEdit() {
    var url = "http://192.168.137.107/empleo/editdata.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "role": controllerRole.text
    });
  }

  @override
  void initState() {
    controllerUsername =
        new TextEditingController(text: widget.list[widget.index]['username']);
    controllerPassword =
        new TextEditingController(text: widget.list[widget.index]['password']);
    controllerRole =
        new TextEditingController(text: widget.list[widget.index]['role']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDITAR USER"),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.orange),
                  title: new TextFormField(
                    controller: controllerUsername,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre de usurio";
                    },
                    decoration: new InputDecoration(
                      hintText: "Usuario",
                      labelText: "Usuario",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.lock_outline, color: Colors.orange),
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
                new ListTile(
                  leading: const Icon(Icons.settings_input_component,
                      color: Colors.orange),
                  title: new TextFormField(
                    controller: controllerRole,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un Role";
                    },
                    decoration: new InputDecoration(
                      hintText: "Role",
                      labelText: "Role",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Guardar"),
                  color: Colors.green,
                  onPressed: () {
                    dataEdit();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VistaHoracio()));
                  },
                ),
                RaisedButton(
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
    );
  }
}
