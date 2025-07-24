import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FastFoods extends StatefulWidget {
  const FastFoods({super.key});

  @override
  State<FastFoods> createState() => _FastFoodsState();
}

class _FastFoodsState extends State<FastFoods> {
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
    final marcadorPlanetBurguer = Marker(
      markerId: MarkerId('PlanetBurguer'),
      position: LatLng(-5.139047171472176, -42.77882620897852),
      infoWindow: InfoWindow(
        title: 'Planet Burguer',
        snippet: 'Planet Burguer Teresina',
      ),
    );
    final marcadorBurguerMania = Marker(
      markerId: MarkerId('BurguerMania'),
      position: LatLng(-5.1449063005736795, -42.779266137782614),
      infoWindow: InfoWindow(
        title: 'Burguer Mania',
        snippet: 'Burguer Mania THE',
      ),
    );

    setState(() {
      _marcadores = {marcadorPlanetBurguer, marcadorBurguerMania};
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
        title: Text('Fast Foods'),
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
