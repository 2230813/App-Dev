import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  static final LatLng _center = const LatLng(45.5144626, -73.6755719);
  final Set<Marker> _markers = {};
  LatLng _currentMapPosition = _center;

  void _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(Marker(markerId: MarkerId(_currentMapPosition.toString()),
      position: _currentMapPosition,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position){
    _currentMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mao Demo'),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 10.0
                ),

              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: _onAddMarkerButtonPressed,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.map, size: 30.0,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
