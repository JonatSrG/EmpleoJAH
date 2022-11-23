import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:convert';

class VistaAlumnoPage extends StatefulWidget {
  @override
  _VistaAlumnoPageState createState() => _VistaAlumnoPageState();
}

class _VistaAlumnoPageState extends State<VistaAlumnoPage> {
  openwhatsapp() async {
    var whatsapp = "+522414191239";
    var whatsappURl_android = "whatsapp://send?phone=" +
        whatsapp +
        "&text=¿Me proporciona mas información sobre la vacante?";
    var whatappURL_ios =
        "https://wa.me/$whatsapp?text=${Uri.parse("Requiero mas Informacion")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        /* ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed"))); */
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        /* ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed"))); */
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bolsa de Empleo UT-Tlaxcala'),
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
                  'Enviar CV a IT-Global o Presentarse en Av Pensamientos #14 Apizaco,Tlaxcala con un horario de 10am a 6pm',
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
                    onPressed: () {
                      openwhatsapp();
                    },
                    color: Colors.green[400],
                    child: Text(
                      'Mas Informacion',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
