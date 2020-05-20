import 'package:flutter/material.dart';

import 'package:quien_lo_tiene/src/models/tipoDocumento.dart';

class ReportDocumentPage extends StatefulWidget {

  @override
  _ReportDocumentPageState createState() => _ReportDocumentPageState();
}

class _ReportDocumentPageState extends State<ReportDocumentPage> {

  String _textFechaNacimiento = '';
  String _textFechaExpedicion = '';
  String fechaTiempo          = '';
  Divider _divider = Divider(height: 30, color: Colors.transparent);
  String _opcionSeleccionada  = 'Cedula';
  String _cedula = "";

  TextEditingController _inputFieldDateControllerN = new TextEditingController();
  TextEditingController _inputFieldDateControllerE = new TextEditingController();

  final tipoDocumento = new TipoDocumento(); //Importaciión de tipo documento

  TextStyle estilosPortada = TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0);

  EdgeInsets margenInputs = EdgeInsets.symmetric(horizontal: 20.0); //traerla desde otra clase

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
        CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _portada(),
                  Center(child: _titleReport()),
                  Divider(),
                  _formTypeDocument(),
                  _divider,
                  _numberDocument(),
                  _divider,
                  _fechaNacimiento(),
                  _divider,
                  _fechaExpedicion(),
                  _localizacionDocumento(),
                  Row(
                    children: <Widget>[
                      _cancelar(),
                      _guardar(),
                    ],
                  )
                ]
              ))
          ],
        )
    );
  }

  Widget _portada() {

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ]
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60))
      ),
      height: 250.0,
      width: double.infinity,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _texto1Portada(),
              Divider(),
              Divider(),
              _texto2Portada()
            ],
          ),
        )
      ),
    );
  }

  Widget _texto1Portada() {

    return Container(
      child: Text('Hola amigo!', style: TextStyle(color: Colors.white, fontSize: 20.0))
    );
  }

  Widget _texto2Portada() {

    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 225, 255, 0.3),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Gracias por utilizar nuestros servicios', style: estilosPortada),
              Text('Por favor diligencia los datos del', style: TextStyle(color: Colors.white)),
              Text('documento a reportar', style: TextStyle(color: Colors.white))
            ],
          ),
        ],
      ),
    );
  }

  Widget _titleReport() {

    return Container(
      margin: EdgeInsets.only(
        top: 50,
        bottom: 20,
      ),
      child: Text(
        'Reporta un documento',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _formTypeDocument() {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey
        )
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20.0,),
          Expanded(
            child: DropdownButton(
              underline: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide.none)
                )
              ),
              value: _opcionSeleccionada,
              items: tipoDocumento.getOpcionesDropdown(),
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada = opt;
                  // print(_opcionSeleccionada);
                });
              }
            )
          )
        ],
      ),
    );
  }

  Widget _numberDocument() {

    return Container(
      margin: margenInputs,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          labelText: 'Digita el número',
          hintText: 'Número',
          suffixIcon: Icon(Icons.dialpad)
        ),
        onChanged: (opt) {
          setState(() {
            _cedula = opt;
          });
        }
      ),
    );
  }

  Widget _fechaNacimiento() {

    return Container(
      margin: margenInputs,
      child: TextField(
        controller: _inputFieldDateControllerN,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.date_range),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDateN(context);
        },
      ),
    );
  }

  Widget _fechaExpedicion() {

    return Container(
      margin: margenInputs,
      child: TextField(
        controller: _inputFieldDateControllerE,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          labelText: 'Fecha de expedición',
          suffixIcon: Icon(Icons.date_range)
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDateE(context);
        },
      ),
    );
  }

  _selectDateN (BuildContext context) async {

    DateTime pickedN = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1950),
      lastDate: new DateTime(2021),
      locale: Locale('es', 'ES')
    );

    if (pickedN != null){

      setState(() {
        _textFechaNacimiento = pickedN.toString();
        fechaTiempo = _textFechaNacimiento.substring(0,10);
        _textFechaNacimiento = fechaTiempo;

        _inputFieldDateControllerN.text = _textFechaNacimiento;
      });
    }
  }

  _selectDateE (BuildContext context) async {

    DateTime pickedE = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1950),
      lastDate: new DateTime(2021),
      locale: Locale('es', 'ES')
    );

    if (pickedE != null){

      setState(() {
        _textFechaExpedicion = pickedE.toString();
        fechaTiempo = _textFechaExpedicion.substring(0, 10);
        _textFechaExpedicion = fechaTiempo;

        // print(_textFechaExpedicion.substring(0, 10));
        _inputFieldDateControllerE.text = _textFechaExpedicion;
      });
    }
  }

  Widget _localizacionDocumento() {

    return FlatButton(
      onPressed: () => Navigator.pushNamed(context, 'mapa'),
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 05.0,
          right: 05.0,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 10.0
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.grey
          )
        ),
        child: Row(
          children: <Widget>[
            Text('Reportar localización en mapa'),
            SizedBox(width: 120.0),
            Icon(Icons.zoom_out_map, color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }

  Widget _cancelar() {

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0),
            ]
          )
        ),
        child: FlatButton(
          child: Text('Cancelar', style: TextStyle( color: Colors.white ),),
          hoverColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
    );
  }

  Widget _guardar() {

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20.0, left: 0.0, right: 30.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0),
            ]
          )
        ),
        child: FlatButton(
          child: Text('Guardar', style: TextStyle( color: Colors.white ),),
          hoverColor: Colors.white,
          onPressed: () {

          }
        ),
      ),
    );
  }

}