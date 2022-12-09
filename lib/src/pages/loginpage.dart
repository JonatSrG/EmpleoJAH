import 'dart:convert';

import 'package:empleo_jah/src/pages/astridPerfil.dart';
import 'package:empleo_jah/src/pages/jonaPerfil.dart';
import 'package:empleo_jah/src/pages/horacioPerfil.dart';
import 'package:empleo_jah/src/pages/vistaAdminPage.dart';
import 'package:empleo_jah/src/pages/vistaAlumnoPage.dart';
import 'package:empleo_jah/src/pages/vistaHoracio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String username;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String mensaje = '';
//metdo para saber que usuario se va estar logiando
  Future<List> login() async {
    final response =
        await http.post('http://192.168.0.111/empleo/login.php', body: {
      "username": controllerUser.text,
      "password": controllerPass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        mensaje = "Usuario o Contraseña son Incorrectas";
      });
    } else {
      if (datauser[0]['role'] == 'Vacante') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VistaAdminPage()));
      } else if (datauser[0]['role'] == 'Alumno') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VistaAlumnoPage()));
      } else if (datauser[0]['role'] == 'Escolar') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VistaHoracio()));
      }
      setState(() {
        username = datauser[0]['username'];
      });
    }
    return datauser;
  }

//Constuir mi login
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bolsa de Empleo UT-Tlaxcala'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Developers', textAlign: TextAlign.center),
                      content: Stack(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JonaPerfil())),
                                    child: Image.asset('assets/jona.jpg')),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HoracioPerfil())),
                                  child: Image.asset('assets/horacio.jpeg'),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AstridPerfil())),
                                  child: Image.asset('assets/yadira.jpg'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20)),
          Image.asset(
            'assets/BolsaTrabajoUtt.png',
            width: 100,
            height: 100,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(15),
            elevation: 10,
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  child: Form(
                    child: TextFormField(
                      controller: controllerUser,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person_outline_outlined),
                        hintText: 'User',
                        labelText: 'Name',
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  child: Form(
                    child: TextFormField(
                      obscureText: true,
                      controller: controllerPass,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock_outline),
                        hintText: 'Introduce your Password',
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(15)),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                      right: 32,
                    ),
                    child: Text(
                      '¿Olvidaste tu Contraseña?',
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(15)),
                RaisedButton(
                  child: Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    login();
                  },
                ),
                Text(
                  mensaje,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
