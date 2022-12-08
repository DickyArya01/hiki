
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hiki/app/data/models/futsal.dart';
import 'package:hiki/app/modules/detail/view/detail.dart';
import 'package:hiki/app/routes/app_pages.dart';
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
  bool showDesc = false;

  late Widget _viewDescCardHandler = Container();

  final List<Marker> _listFutsalMarker = [];

  final List<Marker> _showMarker = [];


  @override
  void initState() {
    // TODO: implement initState
    _mapController = MapController();
    _getCurrentPosition();
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
              _viewDescCardHandler
            ],
          ),
        ));
  }

  void _moveCameraToLocation() {
    _mapController.move(LatLng(_userPosition!.latitude, _userPosition!.longitude), 16);
  }

  void _showAllMarker(){
    for(int i = 0; i < listFutsalCourt.length; i++){
      _listFutsalMarker.add(dataMarker(listFutsalCourt[i].lat, listFutsalCourt[i].lon, listFutsalCourt[i].title, listFutsalCourt[i].time, listFutsalCourt[i].court, listFutsalCourt[i].isParkingLotExist));
    }

    _showMarker.add(_userLocation(_userPosition!.latitude, _userPosition!.longitude));
    _showMarker.addAll(_listFutsalMarker);

  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if(!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high).then(
            (Position position) {
              setState(() => _userPosition = position);
              _showAllMarker();
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
        zoom: 14.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a','b','c'],
        ),
        MarkerLayerOptions(markers: _showMarker)
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

  Widget descCard(String title, String time, int court, bool isParkingLotExist){
    return GestureDetector(
      onTap: (){
        setState(() {
          _viewDescCardHandler = Container();
        });
      },
      child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.album),
                title: Text(title),
                subtitle: Text('Buka: $time\nLapangan: $court \nParkir: ${(isParkingLotExist) ? "Ada" : "Tidak ada"}')
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('LIHAT DETAIL'),
                    onPressed: () {
                      Get.toNamed(Routes.DETAIL);
                    },
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('PESAN'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
    );
  }

  Marker dataMarker(double lat, double lon, String title, String time, int court, bool isParkingLotExist) {
    return Marker(
        point: LatLng(lat,lon),
        width: 300,
        height: 168.75,
        builder: (context) => GestureDetector(
            onTap: () {
              setState((){
                _viewDescCardHandler = descCard(title, time, court, isParkingLotExist);
              });
            },
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 32,
            )
        )
    );
  }

  Marker _userLocation(double userLatitude, double userLongitude){
    return Marker(
        point: LatLng(userLatitude, userLongitude),
        builder: (context) => const Icon(
          Icons.my_location,
          color: Colors.red,
          size: 32,
        ));
  }

}
