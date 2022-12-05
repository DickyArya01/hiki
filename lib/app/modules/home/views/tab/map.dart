import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapTab extends StatefulWidget {
  const MapTab({Key? key}) : super(key: key);

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {

  // Position userPosition = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0);

  Position? _userPosition;

  late MapController _mapController;

  @override
  void initState() {
    // TODO: implement initState
    _getCurrentPosition();
    _mapController = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              (_userPosition == null) ?
                _loadingView()
              : _flutterMap(_userPosition!.latitude, _userPosition!.longitude),
              _floatingActionButton(),
            ],
          ),
        ));
  }

  void _moveCameraToLocation() {
    _mapController.move(LatLng(_userPosition!.latitude, _userPosition!.longitude), 16);
  }


  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if(!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high).then(
            (Position position) {
              setState(() => _userPosition = position);
        }).catchError((e){
          debugPrint(e);
    });

  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      print("permission disabled");
      return false;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("permision denied by user");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("permision denied forever by user");
      return false;
    }
    return true;

  }

  Widget _flutterMap(double userLatitude, double userLongitude){
    return FlutterMap(
      options: MapOptions(
        center: LatLng(userLatitude, userLongitude),
        zoom: 16.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a','b','c'],
        ),
        MarkerLayerOptions(markers: [
          Marker(
              point: LatLng(userLatitude, userLongitude),
              builder: (context) => const Icon(
                Icons.my_location,
                color: Colors.red,
                size: 32,
              ))
        ])
      ],
      mapController: _mapController,
    );
  }

  Widget _floatingActionButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: kBottomNavigationBarHeight, right: 8),
        child: MaterialButton(
            shape: const CircleBorder(),
            color: Colors.red,
            onPressed: (){
              _moveCameraToLocation();
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.my_location, size: 32,
              ),
            )
        ),
      ),
    );

  }

  Widget _loadingView() {
    return Container(
        color: Colors.black38,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Center(child: CircularProgressIndicator(color: Colors.blue),));
  }



}
