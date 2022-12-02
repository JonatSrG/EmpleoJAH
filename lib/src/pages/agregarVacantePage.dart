import 'package:flutter/material.dart';
import 'package:empleo_jah/src/pages/vistaAdminPage.dart';
import 'package:http/http.dart' as http;

class AgregarVacante extends StatefulWidget {
  @override
  State<AgregarVacante> createState() => _AgregarVacanteState();
}

class _AgregarVacanteState extends State<AgregarVacante> {
  TextEditingController controllerTitulo = new TextEditingController();
  TextEditingController controllerDescripcion = new TextEditingController();
  TextEditingController controllerEmpresa = new TextEditingController();
  TextEditingController controllerTelefono = new TextEditingController();
  TextEditingController controllerCorreo = new TextEditingController();
  TextEditingController controllerDireccion = new TextEditingController();
  TextEditingController controllerNombreRH = new TextEditingController();
  TextEditingController controllerImage = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void agregarVacante() {
    var url = "http://192.168.68.110/empleo/addvacante.php";
    http.post(url, body: {
      "titulo": controllerTitulo.text,
      "descricion": controllerDescripcion.text,
      "empresa": controllerEmpresa.text,
      "telefono": controllerTelefono.text,
      "correo": controllerCorreo.text,
      "direccion": controllerDireccion.text,
      "nombrerh": controllerNombreRH.text,
      "image": controllerImage.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Vacante'),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.menu, color: Colors.orange),
                    title: TextFormField(
                      controller: controllerTitulo,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa un Titulo";
                      },
                      decoration: InputDecoration(
                        hintText: "Titulo Vacante",
                        labelText: "Titulo Vacante",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  ListTile(
                    leading: Icon(Icons.menu, color: Colors.orange),
                    title: TextFormField(
                      controller: controllerDescripcion,
                      validator: (value) {
                        if (value.isEmpty) return "Ingrese una Desc";
                      },
                      decoration: InputDecoration(
                        hintText: "Descripcion",
                        labelText: "Descripcion",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  ListTile(
                    leading: Icon(Icons.menu, color: Colors.orange),
                    title: TextFormField(
                      controller: controllerEmpresa,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa Nom. Empresa";
                      },
                      decoration: new InputDecoration(
                        hintText: "Nom Empresa",
                        labelText: "Nom. Empresa",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  ListTile(
                    leading: Icon(Icons.menu, color: Colors.orange),
                    title: TextFormField(
                      controller: controllerTelefono,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa un num telefono";
                      },
                      decoration: new InputDecoration(
                        hintText: "Num Telefono",
                        labelText: "Num. Telefono",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  ListTile(
                    leading: Icon(Icons.menu, color: Colors.orange),
                    title: TextFormField(
                      controller: controllerCorreo,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa un correo";
                      },
                      decoration: new InputDecoration(
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
                      decoration: new InputDecoration(
                        hintText: "Direecion",
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
                        if (value.isEmpty) return "Ingresa Nombre RH";
                      },
                      decoration: new InputDecoration(
                        hintText: "Nombre RH",
                        labelText: "Nombre Rh",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  ListTile(
                    leading: Icon(Icons.menu, color: Colors.orange),
                    title: TextFormField(
                      controller: controllerImage,
                      validator: (value) {
                        if (value.isEmpty) return "Ingrasa URL de Image";
                      },
                      decoration: new InputDecoration(
                        hintText: "URL de Image",
                        labelText: "URL de Image",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  RaisedButton(
                    child: new Text("Agregar"),
                    color: Colors.green,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VistaAdminPage()));
                        agregarVacante();
                      }
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
      ),
    );
  }
}
