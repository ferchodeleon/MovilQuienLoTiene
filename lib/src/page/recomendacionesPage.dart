import 'package:flutter/material.dart';

import 'dart:ui';
import 'dart:math';

class RecomendacionesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _fondo(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _titulo(context),
                  _gridRecomendaciones()
                ],
              ),
            )
          ]
        )
      ),
    );
  }

  Widget cardVerificarDocumento() {

    final card = Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/image/original.gif'),
            image: AssetImage('assets/image/verificaDocumento.jpg'),
            height: 300,
          ),
          ListTile(
            title: Text('Verifica tu documento'),
            subtitle: Text('Si en nuestra base de datos encuentras tu documento, debes verificar su autenticidad, igual como se te solicitan los datos de verificación'),
            contentPadding: EdgeInsets.all(10),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius:10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          )
        ]
      ),
      child: card,
    );
  }

  Widget _fondo() {

    final contenedor = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.4),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ]
        )
      ),
    );

    final cuadro = Transform.rotate(
      angle: -pi / 5,
      child: Container(
        height: 360.0,
        width: 340.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(0.3, 0.4),
            end: FractionalOffset(0.0, 0.8),
            colors: [
              Color.fromRGBO(31, 201, 208, 1.0),
              Color.fromRGBO(35, 205, 120, 1.0)
            ]
          ),
          borderRadius: BorderRadius.circular(30.0)
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        contenedor,
        Positioned(
          top: -90.0,
          child: cuadro
        )
      ],
    );
      
  }

  Widget _titulo(BuildContext context) {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 0.5),
        height: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.arrow_back, size: 30.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 0.0),
            Text('Recomendaciones', style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0,),
            Text('¡Ten encuenta estas recomendaciones!', style: TextStyle( color: Colors.white, fontSize: 18.0),),
            Text('primero esta tu bienestar', style: TextStyle( color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }

  Widget _gridRecomendaciones() {

    return Table(
      children: [
        TableRow(
          children: [
            _cuadroBoton(Icons.check_circle, 'Verifica tu documento'),
            _cuadroBoton(Icons.attach_money, 'Recompensa'),
          ]
        ),
        TableRow(
          children: [
            _cuadroBoton(Icons.thumb_up, 'Amabilidad'),
            _cuadroBoton(Icons.local_taxi, 'Acompañamiento Policial'),
          ]
        ),
        TableRow(
          children: [
            _cuadroBoton(Icons.lock_outline, 'Datos personales'),
            _cuadroBoton(Icons.group, 'Estar en compañia'),
          ]
        ),
        TableRow(
          children: [
            _cuadroBoton(Icons.credit_card, 'Protege tus datos personales'),
            _cuadroBoton(Icons.place, 'Cita en un lugar concurrido'),
          ]
        )
      ],
    );
  }

  Widget _cuadroBoton( IconData icono, String texto ) {

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 5.0, sigmaY: 0.0 ),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromRGBO(62, 66, 107, 0.7)
          ),
          child: FlatButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icono, color: Color.fromRGBO(31, 201, 208, 1.0), size: 60.0,),
                SizedBox(height: 30.0),
                Text(texto, style: TextStyle(color: Colors.white, fontSize: 15.0), textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      ),
    );
  }

}