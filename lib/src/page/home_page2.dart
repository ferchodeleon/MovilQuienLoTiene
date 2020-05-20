import 'package:flutter/material.dart';
import 'package:quien_lo_tiene/src/page/mapa_page.dart';

import 'dart:math';

import 'package:quien_lo_tiene/src/page/recomendacionesPage.dart';
import 'package:quien_lo_tiene/src/page/report_document_page.dart';
import 'package:quien_lo_tiene/src/page/search_document_page.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _tituloPortada(),
                _imagePortada(),
                _descripcionPortada(),
              ],
            ),
          ),
          _pagina2()
        ]
      ),
    );
  }

  Widget _tituloPortada() {
    return Container(
      margin: EdgeInsets.only( top: 0.0, right: 30.0, left: 30.0 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Hola todos', style: TextStyle(color: Colors.black, fontSize: 20.0)),
          SizedBox(height: 10.0),
          Text('Bienvenido a QuienLoTiene.co', style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold ))
        ],
      ),
    );
  }

  Widget _imagePortada() {

    // print( _screeSized );
    final _screeSized = MediaQuery.of(context).size;
    double alturaGeneral = _screeSized.height - 770.0;
    double bajoGeneral = _screeSized.height-890.0;

    return Container(
      padding: EdgeInsets.only( top: 10.0, bottom: 0.0),
      child: Image(
        image: AssetImage('assets/image/social_map.png'),
      ),
    );
  }

  Widget _descripcionPortada() {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Aquí puedes reportar y buscar documentos perdidos', style: TextStyle( fontSize: 16.0 ), textAlign: TextAlign.center, ),
          SizedBox(height: 160.0),
          Text('Desliza hacia abajo para iniciar', style: TextStyle(fontSize: 20.0), ),
          Icon(Icons.keyboard_arrow_down, size: 60.0,)
        ],
      ),
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

  Widget _pagina2() {

    return PageView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            // _fondo(),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _page2AppBar(),
                  _description(),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buttonBuscarDocumentos(context),
                      SizedBox(width: 10.0),
                      _buttonReportarDocumentos(context),
                    ],
                  ),
                  _buttonNecesitasAyuda(context)
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _page2AppBar() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 110.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(52, 58, 64, 1),
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/image/logo.png'),
            )
          ],
        ),
      ),
    );
  }

  Widget _description() {

    return Container(
      height: 200,
      margin: EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 0.0
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Quien lo tiene, es un servicio gratuito donde puedes reportar y buscar documentos de una forma facil e intuitiva, te invitamos para que accedas a nuestros servicios.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 50.0,),
          Text(
            '¡Comienza ahora!',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
          )
        ]
      )
    );

  }

  RaisedButton _buttonBuscarDocumentos(BuildContext context) {

    return RaisedButton(
      // color: Col
      color: Color.fromRGBO(41, 127, 154, 1.0),
      child: Text('Buscar Documento'),
      textColor: Colors.white,
      onPressed: () {

        final route = MaterialPageRoute(
          builder: (context) => SearchDocumentPage()
        );

        Navigator.push(context, route);
      },
    );
  }

  Widget _buttonReportarDocumentos(BuildContext context) {

    return Container(
      child: RaisedButton(
        color: Color.fromRGBO(52, 54, 101, 1.0),
        child: Text('Reportar Documento'),
        textColor: Colors.white,
        onPressed: () {

          final route = MaterialPageRoute(
            builder: (context) => ReportDocumentPage()
          );
          Navigator.push(context, route);
        },
      ),
    );
  }

  Widget _buttonNecesitasAyuda(BuildContext context) {

    return Container(
      alignment: Alignment.bottomCenter,
      height: 100,
      child: FlatButton(
        child: Text('Necesitas ayuda'),
        onPressed: () {

          Navigator.pushNamed(context, 'recomendaciones');
          // Navigator.pushNamed(context, 'mapa');
        },
      ),
    );
  }

}