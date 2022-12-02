import 'package:empleo_jah/src/pages/detail.dart';
import 'package:empleo_jah/src/pages/vistaAlumnoPage.dart';
import 'package:empleo_jah/src/pages/vistaHoracio.dart';
import 'package:flutter/material.dart';
import 'package:empleo_jah/src/pages/loginpage.dart';
import 'package:empleo_jah/src/pages/vistaAdminPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      title: 'JAH Empleos',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        'vistaAdminPage': (BuildContext buildContext) => VistaAdminPage(),
        'vistaAlumnoPage': (BuildContext buildContext) => VistaAlumnoPage(),
        'loginPage': (BuildContext buildContext) => LoginPage(),
        'vistaHoracio': (BuildContext buildContext) => VistaHoracio(),
        'detail': (BuildContext buildContext) => Detail(),
      },
    );
  }
}
