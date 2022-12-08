import 'package:empleo_jah/src/pages/vistaAdminPage.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class EditarVacantePage extends StatefulWidget {
  final List lista;
  final int index;

  EditarVacantePage({this.lista, this.index});

  @override
  State<EditarVacantePage> createState() => _EditarVacantePageState();
}

class _EditarVacantePageState extends State<EditarVacantePage> {
  TextEditingController controllerTitulo;
  TextEditingController controllerDescripcion;
  TextEditingController controllerEmpresa;
  TextEditingController controllerTelefono;
  TextEditingController controllerCorreo;
  TextEditingController controllerDireccion;
  TextEditingController controllerNombreRH;
  TextEditingController controllerImage;

  void editarVacante() {
    var url = "http://192.168.245.110/empleo/editvacante.php";
    http.post(url, body: {
      'id': widget.lista[widget.index]['id'],
      'titulo': controllerTitulo.text,
      'descricion': controllerDescripcion.text,
      'empresa': controllerEmpresa.text,
      'telefono': controllerTelefono.text,
      'correo': controllerCorreo.text,
      'direccion': controllerDireccion.text,
      'nombrerh': controllerNombreRH.text,
      'image': controllerImage.text,
    });
  }

  @override
  void initState() {
    controllerTitulo =
        new TextEditingController(text: widget.lista[widget.index]['titulo']);
    controllerDescripcion = new TextEditingController(
        text: widget.lista[widget.index]['descricion']);
    controllerEmpresa =
        new TextEditingController(text: widget.lista[widget.index]['empresa']);
    controllerTelefono =
        new TextEditingController(text: widget.lista[widget.index]['telefono']);
    controllerCorreo =
        new TextEditingController(text: widget.lista[widget.index]['correo']);
    controllerDireccion = new TextEditingController(
        text: widget.lista[widget.index]['direccion']);
    controllerNombreRH =
        new TextEditingController(text: widget.lista[widget.index]['nombrerh']);
    controllerImage =
        new TextEditingController(text: widget.lista[widget.index]['image']);

    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Editar Vacante'),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.menu, color: Colors.orange),
                  title: TextFormField(
                    controller: controllerTitulo,
                    validator: (value) {
                      if (value.isEmpty)
                        return "Ingresa un Titulo para la Vacante";
                    },
                    decoration: InputDecoration(
                      hintText: 'Titulo Vacante',
                      labelText: 'Titulo Vacante',
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                ListTile(
                  leading: Icon(Icons.menu, color: Colors.orange),
                  title: TextFormField(
                    controller: controllerDescripcion,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Ingresa una Descripcion";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Descripcion',
                      labelText: 'Descripcion',
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                ListTile(
                  leading: Icon(Icons.menu, color: Colors.orange),
                  title: TextFormField(
                    controller: controllerEmpresa,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Ingresa nombre de la empresa";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Nombre de la Empresa',
                      labelText: 'Nombre de la Empresa',
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                ListTile(
                  leading: Icon(Icons.menu, color: Colors.orange),
                  title: TextFormField(
                    controller: controllerTelefono,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa Nom. Empresa";
                    },
                    decoration: InputDecoration(
                      hintText: "Nom. de la Empresa",
                      labelText: "Nom. de la Empresa",
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                ListTile(
                  leading: Icon(Icons.menu, color: Colors.orange),
                  title: TextFormField(
                    controller: controllerCorreo,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un Correo";
                    },
                    decoration: InputDecoration(
                      hintText: "Correo",
                      labelText: "Correo",
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                ListTile(
                  leading: Icon(Icons.menu, color: Colors.orange),
                  title: TextFormField(
                    controller: controllerDireccion,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa una Direccion";
                    },
                    decoration: InputDecoration(
                      hintText: "Direccion",
                      labelText: "Direccion",
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                ListTile(
                  leading: Icon(Icons.menu, color: Colors.orange),
                  title: TextFormField(
                    controller: controllerNombreRH,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un Nombre";
                    },
                    decoration: InputDecoration(
                      hintText: "NombreRH",
                      labelText: "NombreRH",
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                ListTile(
                  leading: Icon(Icons.menu, color: Colors.orange),
                  title: TextFormField(
                    controller: controllerImage,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un URL";
                    },
                    decoration: InputDecoration(
                      hintText: "URL de Image",
                      labelText: "URL de Image",
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                RaisedButton(
                  child: new Text("Guardar"),
                  color: Colors.green,
                  onPressed: () {
                    editarVacante();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VistaAdminPage()));
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
