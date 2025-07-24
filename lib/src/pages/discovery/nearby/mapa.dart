import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
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
    final marcadorIfpisul = Marker(
      markerId: MarkerId('IFPIsul'),
      position: LatLng(-5.102018104100451, -42.812836988485046),
      infoWindow: InfoWindow(
        title: 'IFPI Sul',
        snippet: 'Instituto Federal do Piauí - Zona Sul',
      ),
    );
    final marcadorIfpicentral = Marker(
      markerId: MarkerId('IFPIcentral'),
      position: LatLng(-5.081787834460528, -42.820872592294),
      infoWindow: InfoWindow(
        title: 'IFPI Central',
        snippet: 'Instituto Federal do Piauí - Central',
      ),
    );
    final marcadorUfpi = Marker(
      markerId: MarkerId('UFPI'),
      position: LatLng(-5.057381548012374, -42.79787248550588),
      infoWindow: InfoWindow(
        title: 'UFPI',
        snippet:
            'Universidade Federal do Piauí - Campus Ministro Petrônio Portella',
      ),
    );
    final marcadorUespi = Marker(
      markerId: MarkerId('UESPI'),
      position: LatLng(-5.078763480633865, -42.82743052281436),
      infoWindow: InfoWindow(
        title: 'UESPI',
        snippet: 'Universidade Estadual do Piauí - Campus Clóvis Moura',
      ),
    );
    final marcadorTeresinaShopping = Marker(
      markerId: MarkerId('TeresinaShopping'),
      position: LatLng(-5.085257503661429, -42.79022298536948),
      infoWindow: InfoWindow(
        title: 'Teresina Shopping',
        snippet: 'Avenida Raul Lopes',
      ),
    );
    final marcadorRiversideShopping = Marker(
      markerId: MarkerId('RiversideShopping'),
      position: LatLng(-5.078491749243907, -42.79516479440897),
      infoWindow: InfoWindow(
        title: 'Riverside Shopping',
        snippet: 'Shopping às margens do Rio Poti',
      ),
    );
    final marcadorRioPoty = Marker(
      markerId: MarkerId('ShoppingRioPoty'),
      position: LatLng(-5.077063541597641, -42.80173831655732),
      infoWindow: InfoWindow(
        title: 'Shopping Rio Poty',
        snippet: 'Shopping',
      ),
    );
    final marcadorShoppingCidade = Marker(
      markerId: MarkerId('ShoppingCidade'),
      position: LatLng(-5.091296374501219, -42.81847358778945),
      infoWindow: InfoWindow(
        title: 'Shopping da Cidade',
        snippet: 'Centro comercial de Teresina',
      ),
    );
    final marcadorPonteEstaiada = Marker(
      markerId: MarkerId('PonteEstaiada'),
      position: LatLng(-5.069072296600401, -42.80171898915876),
      infoWindow: InfoWindow(
        title: 'Ponte Estaiada',
        snippet: 'Monumento Turístico',
      ),
    );
    setState(() {
      _marcadores = {
        marcadorShoppingCidade,
        marcadorRioPoty,
        marcadorRiversideShopping,
        marcadorTeresinaShopping,
        marcadorUespi,
        marcadorUfpi,
        marcadorIfpisul,
        marcadorPonteEstaiada,
        marcadorIfpicentral
      };
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
      appBar: AppBar(title: Text('Mapa'), backgroundColor: Colors.amber),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        markers: _marcadores,
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
