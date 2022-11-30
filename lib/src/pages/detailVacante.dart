import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class DetailVacantes extends StatefulWidget {
  List listas;
  int index;

  DetailVacantes({this.index, this.listas});

  @override
  State<DetailVacantes> createState() => _DetailVacantesState();
}

class _DetailVacantesState extends State<DetailVacantes> {
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
        title: Text('Detalles de la vacante'),
        automaticallyImplyLeading: false,
      ),
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        elevation: 10,
        child: Center(
          child: Column(
            children: <Widget>[
              Image.network(
                widget.listas[widget.index]['image'],
                fit: BoxFit.cover, // Fixes border issues
                width: 200,
                height: 200,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                title: Text(
                  "Titulo: " + widget.listas[widget.index]['titulo'] + "\n",
                  style:
                      new TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                subtitle: Text(
                  "Descripcion: " +
                      widget.listas[widget.index]['descricion'] +
                      "\n" +
                      "\n" +
                      "Empresa: " +
                      widget.listas[widget.index]['empresa'] +
                      "\n" +
                      "Telefono: " +
                      widget.listas[widget.index]['telefono'] +
                      "\n" +
                      "Correo: " +
                      widget.listas[widget.index]['correo'] +
                      "\n" +
                      "Dirección: " +
                      widget.listas[widget.index]['direccion'] +
                      "\n" +
                      "RH: " +
                      widget.listas[widget.index]['nombrerh'] +
                      "\n",
                  style:
                      new TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
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
  }
}
