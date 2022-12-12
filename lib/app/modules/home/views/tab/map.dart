
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hiki/app/data/models/futsal.dart';
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

  late TextEditingController _textFieldController;

  bool showDesc = false;

  late Widget _viewDescCardHandler = Container();

  final List<Marker> _listFutsalMarker = [];

  final List<Marker> _showMarker = [];


  @override
  void initState() {
    // TODO: implement initState
    _mapController = MapController();
    _textFieldController = TextEditingController();
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
              Column(
                children: [
                  (_userPosition == null) ? Container() : textFieldSearch(),
                  _viewDescCardHandler
                ],
              )
            ],
          ),
        ));
  }

  void _moveCameraToLocation() {
    _mapController.move(LatLng(_userPosition!.latitude, _userPosition!.longitude), 16);
  }

  void _showAllMarker(){
    for(int i = 0; i < listFutsalCourt.length; i++){
      _listFutsalMarker.add(dataMarker(listFutsalCourt[i]));
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

  Widget descCard(Futsal data){
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
                leading: const Icon(Icons.album),
                title: Text(data.title),
                subtitle: Text('Buka: ${data.time}\nLapangan: court ${data.court}\nParkir: ${(data.isParkingLotExist) ? "Ada" : "Tidak ada"}')
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('LIHAT DETAIL'),
                    onPressed: () {
                      Get.toNamed(Routes.DETAIL, arguments: data);
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

  Marker dataMarker(Futsal data) {
    return Marker(
        point: LatLng(data.lat,data.lon),
        width: 300,
        height: 168.75,
        builder: (context) => GestureDetector(
            onTap: () {
              setState((){
                _viewDescCardHandler = descCard(data);
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

  Widget textFieldSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: (value) => updateList(value),
        controller: _textFieldController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "Search by region",
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
        ),
      ),
    );
  }

  void updateList(String value) {
    setState(() {
      List<Futsal> listFutsal = List.from(listFutsalCourt);
      List<Futsal> listFutsalFiltered = listFutsal.where((element) => element.title!.toLowerCase().contains(value.toLowerCase())).toList();
      _listFutsalMarker.clear();

      for(int i = 0; i < listFutsalFiltered.length; i++){
        _listFutsalMarker.add(dataMarker(listFutsalFiltered[i]));
      }

      _showMarker.clear();

      _showMarker.add(_userLocation(_userPosition!.latitude, _userPosition!.longitude));
      _showMarker.addAll(_listFutsalMarker);

    });
  }

}
