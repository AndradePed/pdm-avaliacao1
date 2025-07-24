import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
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
    final marcadorBardoProfessor = Marker(
      markerId: MarkerId('BardoProfessor'),
      position: LatLng(-5.103848054392496, -42.79577540764119),
      infoWindow: InfoWindow(
        title: 'Bar do Professor',
        snippet: 'Bar do Professor Teresina',
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


    setState(() {
      _marcadores = {marcadorChurrascariaCalcadadeCasa, marcadorBardoProfessor};
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
        title: Text('Bar & Hotels'),
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
