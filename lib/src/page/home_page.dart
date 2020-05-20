import 'package:flutter/material.dart';
import 'package:quien_lo_tiene/src/page/recomendacionesPage.dart';
import 'package:quien_lo_tiene/src/page/report_document_page.dart';
import 'package:quien_lo_tiene/src/page/search_document_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _logo(),
          Divider(
            indent: 40,
            color: Color.fromRGBO(52, 58, 64, 1),
            endIndent: 40,
          ),
          _title(),
          _description(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buttonReportarDocumentos(context),
              _buttonBuscarDocumentos(context),              
            ],
          ),
          _buttonNecesitasAyuda(context),
        ],
      )
    );
  }

  Widget _logo() {

    return Column(
      children: <Widget>[
        Container(
          height: 300,
          margin: EdgeInsets.only(bottom: 50.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color.fromRGBO(30, 48, 64, 1), Color.fromRGBO(52, 58, 64, 1)]
            ),
          ),
          child: Image.asset('assets/image/logo.png'),
        )
      ],
    );
  }

  Widget _title() {

    final title = Container(
      margin: EdgeInsets.only(
        top: 30,
        bottom: 20,
      ),
      child: Text(
        'Quien lo tiene.co',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    return title;
  }

  Widget _description() {

    return Container(
      height: 200,
      margin: EdgeInsets.only(
        top: 20.0,
        left: 40,
        right: 40
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
      ),
      child: Text(
        "Quien lo tiene, es un servicio gratuito donde puedes reportar y buscar documentos de una forma facil e intuitiva, te invitamos para que accedas a nuestros servicios, comienza ahora mismo.",
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 18,
      ),
      ),
    );
  }

  Widget _buttonReportarDocumentos(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromRGBO(220, 53, 69, 1),
      ),
      child: FlatButton(
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

  Widget _buttonBuscarDocumentos(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromRGBO(40, 167, 69, 1),
      ),
      child: FlatButton(
        child: Text('Buscar Documento'),
        textColor: Colors.white,
        onPressed: () {
          final route = MaterialPageRoute(
            builder: (context) => SearchDocumentPage()
          );

          Navigator.push(context, route);
        },
      ),
    );
  }

  Widget _buttonNecesitasAyuda(BuildContext context) {

    return Expanded(
      child: SafeArea(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: FlatButton(
            child: Text('Recomendaciones'),
            onPressed: () {
              
              final route = MaterialPageRoute(
                builder: (context) => RecomendacionesPage()
              );

              Navigator.push(context, route);
            },
          ),
        ),
      ),
    );
  }

}