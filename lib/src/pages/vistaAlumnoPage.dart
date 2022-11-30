import 'dart:io';

import 'package:empleo_jah/src/pages/detailVacante.dart';
import 'package:empleo_jah/src/pages/loginpage.dart';
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
  Future<List> dataVacante() async {
    final response = await http.get('http://192.168.0.108/empleo/dataget.php');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bolsa de Empleo UT-Tlaxcala'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: dataVacante(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ElementoList(
                  listas: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ElementoList extends StatelessWidget {
  final List listas;

  ElementoList({this.listas});

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
    return ListView.builder(
      itemCount: listas == null ? 0 : listas.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailVacantes(
                        listas: listas,
                        index: i,
                      )),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(15),
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Image.network(
                    listas[i]['image'],
                    fit: BoxFit.cover, // Fixes border issues
                    width: 200,
                    height: 200,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                    title: Text(
                      "Titulo: " + listas[i]['titulo'],
                    ),
                    subtitle: Text(listas[i]['descricion']),
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
            ),
          ),
        );
      },
    );
  }
}
