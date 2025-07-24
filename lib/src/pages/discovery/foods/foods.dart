import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
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
    final marcadorFogoCamp = Marker(
      markerId: MarkerId('Fogo Campeiro'),
      position: LatLng(-5.073469440066528, -42.78978735660116),
      infoWindow: InfoWindow(
        title: 'Fogo Campeiro',
        snippet: 'Fogo Campeiro Teresina',
      ),
    );
    final marcadorAdegaDoBoi = Marker(
      markerId: MarkerId('Adega do Boi'),
      position: LatLng(-5.073753021795074, -42.78133100577173),
      infoWindow: InfoWindow(
        title: 'Adega do Boi',
        snippet: 'Adega do Boi Teresina',
      ),
    );

    setState(() {
      _marcadores = {marcadorFogoCamp, marcadorAdegaDoBoi};
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
        title: Text('Featured Foods'),
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
