import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Cafes extends StatefulWidget {
  const Cafes({super.key});

  @override
  State<Cafes> createState() => _CafesState();
}

class _CafesState extends State<Cafes> {
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
    final marcadorMais1cafe = Marker(
      markerId: MarkerId('mais1cafe'),
      position: LatLng(-5.079096357691177, -42.79321612891195),
      infoWindow: InfoWindow(
        title: 'Mais1.Café',
        snippet: 'Mais1.Café Teresina',
      ),
    );
    final marcadorMiraflores = Marker(
      markerId: MarkerId('MiraFlores'),
      position: LatLng(-5.077825477272886, -42.79159575971824),
      infoWindow: InfoWindow(
        title: 'MiraFlores Café',
        snippet: 'MiraFlores Café Teresina',
      ),
    );
    final marcadorVianasCafe = Marker(
      markerId: MarkerId('VianasCafe'),
      position: LatLng(-5.07266202971376, -42.78732492057784),
      infoWindow: InfoWindow(
        title: 'Viana`s Café',
        snippet: 'Viana`s Café Teresina',
      ),
    );
    final marcadorCafeartbar = Marker(
      markerId: MarkerId('CafeArtBar'),
      position: LatLng(-5.091243739821035, -42.81309007915187),
      infoWindow: InfoWindow(
        title: 'Café ArtBar',
        snippet: 'Café ArtBar Teresina',
      ),
    );

    setState(() {
      _marcadores = {marcadorCafeartbar, marcadorVianasCafe, marcadorMiraflores, marcadorMais1cafe};
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
        title: Text('Cafes'),
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
