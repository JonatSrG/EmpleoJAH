import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class VistaAdminPage extends StatefulWidget {
  @override
  _VistaAdminPageState createState() => _VistaAdminPageState();
}

class _VistaAdminPageState extends State<VistaAdminPage> {
  Future<List> getData() async {
    final response =
        await http.get('http://172.31.201.197/empleo/getdata1.php');
    //await http.post('http://192.168.0.105/empleo/getdata1.php');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bolsa de Empleo UT-Tlaxcala'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(children: <Widget>[
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(15),
          elevation: 10,
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  'assets/it-global.jpg',
                  fit: BoxFit.cover, // Fixes border issues
                  width: 200,
                  height: 200,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                title: Text('IT Global'),
                subtitle: Text(
                  'Enviar CV a IT-Global o Presentarse en Av Pensamientos #14 Apizaco,Tlaxcala con un horario de 10am a 6pm \n comunicate: 1234567890 \n email: ItGlobal@gmail.com \n Direccion: Av. Pensamientos #14 Apizaco, Tlaxcala',
                ),
                leading: Icon(Icons.quick_contacts_mail_rounded),
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
                  ]),
            ],
          ),
        )
      ]),
    );
  }
}
