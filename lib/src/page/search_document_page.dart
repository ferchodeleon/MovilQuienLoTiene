import 'package:flutter/material.dart';

import 'package:quien_lo_tiene/src/models/tipoDocumento.dart';

class SearchDocumentPage extends StatefulWidget {
  
  @override
  _SearchDocumentPage createState() => _SearchDocumentPage();
}


class _SearchDocumentPage extends State<SearchDocumentPage> {

  final tipoDocumento = new TipoDocumento();

  TextEditingController _inputFieldDateControllerN = new TextEditingController();
  TextEditingController _inputFieldDateControllerE = new TextEditingController();

  EdgeInsets margenInputs = EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0);
  
  String _opcionSeleccionada  = 'Cedula';
  String _textFechaNacimiento = '';
  String _textFechaExpedicion = '';
  String fechaTiempo          = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        CustomScrollView(
          slivers: <Widget>[
            _appBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(child: _titleReport()),
                  _typeDocument(),
                  _numeroDocumento(),
                  _fechaNacimiento(),
                  _fechaExpedicion(),
                  Row(
                    children: <Widget>[
                      _cancelar(),
                      _guardar()
                    ],
                  )
                ]
              ),
            )
          ],
        )
    );
  }

  Widget _appBar() {

    return SliverAppBar(
      elevation: 2.0,
      expandedHeight: 250.0,
      backgroundColor: Color.fromRGBO(52, 58, 64, 1),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('QuienLoTiene.co'),
        background: FadeInImage(
          placeholder: AssetImage('assets/image/verificaDocumento.jpg'),
          image: AssetImage('assets/image/logo.png'),
          fadeInDuration: Duration(milliseconds: 150),
        )
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
      'Que documento buscas',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

  Widget _typeDocument() {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 3.0),
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

  Widget _numeroDocumento() {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          labelText: 'Número del documento',
          hintText: 'Ingrese el número del documento',
          suffixIcon: Icon(Icons.dialpad)
        ),
      ),
    );
  }

  Widget _fechaNacimiento() {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0), //Adecuar margin en una variable
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
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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

  Widget _cancelar() {

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color.fromRGBO(22, 58, 64, 1), Color.fromRGBO(52, 58, 64, 1)]
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
            colors: [Color.fromRGBO(22, 58, 64, 1), Color.fromRGBO(52, 58, 64, 1)]
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