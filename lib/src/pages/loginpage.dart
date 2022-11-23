import 'dart:convert';

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
        await http.post('http://192.168.0.105/empleo/login.php', body: {
      //ip de red de mi casa
      //await http.post('http://192.168.137.89/empleo/login.php', body: { //ip de astrid de su lap
      //await http.post('http://192.168.85.110/empleo/login.php', body: {
      //ip de telefono de astrid
      "username": controllerUser.text,
      "password": controllerPass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        mensaje = "Usuario o Contraseña son Incorrectas";
      });
    } else {
      if (datauser[0]['role'] == 'Admin') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VistaAdminPage()));
      } else if (datauser[0]['role'] == 'Alumno') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VistaAlumnoPage()));
      } else if (datauser[0]['role'] == 'Vista') {
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {},
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
