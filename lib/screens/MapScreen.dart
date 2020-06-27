import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:spotguide/models/Spot.dart';
import 'package:spotguide/views/SpotDetailBottomSheet.dart';

const double MAP_ZOOM_LEVEL = 17;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Completer<GoogleMapController> _controller = Completer();

  bool _centerUserLocationInMap = true;
  Location _location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  Spot _spot = Spot(
      name: "Krivan",
      locationText: "Krivanske sestky",
      description: "6 schodov pri zeleznicnej stanici");

  CameraPosition get initialCameraPosition {
    return CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    _setupLocationListener();

    return Scaffold(
      body: GoogleMap(
        mapToolbarEnabled: false,
        myLocationEnabled: true,
        onLongPress: generateTestNewSpot,
        mapType: MapType.normal,
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: getFloatingActionButtonIcon(),
        onPressed: () {
            setState(() {
              _centerUserLocationInMap = !_centerUserLocationInMap;
            });
            centerMapToUserLocation();
        },
      ),
      bottomSheet: SpotDetailBottomSheet(spot: _spot,),
    );
  }

  Icon getFloatingActionButtonIcon() {
    if (_centerUserLocationInMap) {
      return Icon(Icons.location_on);
    } else {
      return Icon(Icons.location_off);
    }
  }

  Future<void> centerMapToUserLocation() async {
    final GoogleMapController controller = await _controller.future;
    final CameraPosition newPosition = CameraPosition(
      target: LatLng(_locationData.latitude, _locationData.longitude),
      zoom: MAP_ZOOM_LEVEL,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  Future<void> _setupLocationListener() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen((locationData) {
      _locationData = locationData;
      if (_centerUserLocationInMap) {
        centerMapToUserLocation();
      }
    });
  }

  void generateTestNewSpot(LatLng location) {
    setState(() {
      _spot = Spot(name: "Spot 2", locationText: "Spot 2 locatoin text", description: "Spot 2 description");
    });
  }
}