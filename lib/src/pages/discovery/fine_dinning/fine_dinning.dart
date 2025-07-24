import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dinning extends StatefulWidget {
  const Dinning({super.key});

  @override
  State<Dinning> createState() => _DinningState();
}

class _DinningState extends State<Dinning> {
  GoogleMapController? mapController;

  final LatLng _center = LatLng(-5.0761893228659005, -42.826412370381064);
  Set<Marker> _marcadores = {};

  @override
  void initState() {
    super.initState();
    carregarMarcadores();
    _localizacaoAtual();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void carregarMarcadores() {
    final marcadorQuintaldoChurrasco = Marker(
      markerId: MarkerId('QuintaldoChurrasco'),
      position: LatLng(-5.094298997269817, -42.79900981928713),
      infoWindow: InfoWindow(
        title: 'Quintal do Churrasco',
        snippet: 'Quintal do Churrasco THE',
      ),
    );
    final marcadorChurrascariaCalcadadeCasa = Marker(
      markerId: MarkerId('ChurrascariaCalcadadeCasa'),
      position: LatLng(-5.14440432466116, -42.780355897644576),
      infoWindow: InfoWindow(
        title: 'Churrascaria Calçada de Casa',
        snippet: 'Churrascaria Calçada de Casa THE',
      ),
    );
    final marcadorCasa7Churrascaria = Marker(
      markerId: MarkerId('Casa7Churrascaria'),
      position: LatLng(-5.0952133716257215, -42.79567035494522),
      infoWindow: InfoWindow(
        title: 'Casa 7 Churrascaria',
        snippet: 'Casa 7 Churrascaria Teresina',
      ),
    );


    setState(() {
      _marcadores = {marcadorCasa7Churrascaria,marcadorChurrascariaCalcadadeCasa, marcadorQuintaldoChurrasco};
    });
  }

  void _localizacaoAtual() async {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print('Localização: $position');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fine Dinning'),
        backgroundColor: Colors.amber,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: _marcadores,
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
