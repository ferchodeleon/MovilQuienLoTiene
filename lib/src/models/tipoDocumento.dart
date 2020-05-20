import 'package:flutter/material.dart';

class TipoDocumento {

  String opcionSeleccionada = '';
  List<String> _tipoDocumento = ['Cedula'];

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _tipoDocumento.forEach( (documento) {

      lista.add(DropdownMenuItem(
        child: Text(documento),
        value: documento,
      ));
    });

    return lista;
  }
}