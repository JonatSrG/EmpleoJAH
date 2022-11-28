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
    var url = "http://192.168.0.108/empleo/.php";
    http.post(url, body: {
      'id': widget.lista[widget.index]['id'],
      'titulo': controllerTitulo.text,
      'descricion': controllerDescripcion.text,
      'empresa': controllerDescripcion.text,
      'telefono': controllerDescripcion.text,
      'correo': controllerDescripcion.text,
      'direccion': controllerDescripcion.text,
      'nombrerh': controllerDescripcion.text,
      'image': controllerDescripcion.text,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
