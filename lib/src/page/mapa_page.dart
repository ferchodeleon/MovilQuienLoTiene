import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localización Mapa'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){},
          )
        ],
      ),
      body: _crearFlutterMap()
    );
  }

  getLatLng() {

    // var valor = 'geo:40.724233047051705,-74.00731459101564';
    var valor = 'geo:4.751495,-74.029881';

    final lalo = valor.substring(4).split(',');
    final lat = double.parse( lalo[0] );
    final lng = double.parse( lalo[1] );

    return LatLng( lat, lng );
  }

  Widget _crearFlutterMap() {

    return FlutterMap(
      options: MapOptions(
        center: getLatLng(),
        zoom: 12
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores()
      ],
    );
  }

  _crearMapa() { //Dibuja el mapa con la localización

    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}', //Desde donde obtengo la información del mapa
      additionalOptions: {
        'accessToken' : 'pk.eyJ1IjoiZmVyY2hvZGxlb24iLCJhIjoiY2s5ZGFtd280MDFvZTNsbDcyOGhja2MzbiJ9.AkAwN5U_OZLwHLtBdoq99w', //Token del mapa para utlizar el apiKey
        'id': 'mapbox.streets'
      }
    );
  }

  _crearMarcadores() { //Crear el puntero donde muestra el lugar de las coordenadas

    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: getLatLng(),
          builder: (context) => Container(
            child: Icon(Icons.location_on,
            size: 75.0,
            color: Theme.of(context).primaryColor
            ),
          )
        )
      ]
    );

  }
}