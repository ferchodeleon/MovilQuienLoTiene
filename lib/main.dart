import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:quien_lo_tiene/src/page/home_page2.dart';
import 'package:quien_lo_tiene/src/page/mapa_page.dart';
import 'package:quien_lo_tiene/src/page/recomendacionesPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [ //Configuración para los tipos de lenguajes
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [ //Tipos de lenguajes que acepta la APP
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), // Español
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage2(),
        'mapa' : (BuildContext context) => MapaPage(),
        'recomendaciones' : (BuildContext context) => RecomendacionesPage(),
      },

      theme: ThemeData( //Defino mi color primario para toda la app (Color de la marca)
        primaryColor: Color.fromRGBO(52, 54, 101, 1.0)
      ),
    );
  }
}

