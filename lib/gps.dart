import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'google_map.dart';

class Gps extends StatefulWidget {
  const Gps({Key? key}) : super(key: key);

  @override
  State<Gps> createState() => _GpsState();
}

class _GpsState extends State<Gps> {
  // LocationData _locationData=LocationData();

  Location location = Location();
  String latText = "k";
  String longText = "s";
  double lat = 0;
  double lon = 0;

  @override
  void initState() {
    super.initState();
    mylocation();
    setState(() {});
  }

  Future<void> mylocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
    setState(() {
      lat = locationData.latitude!.toDouble();
      latText = lat.toString();
      lon = locationData.longitude!.toDouble();
      longText = lon.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Latitude : ",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                latText,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Longitude : ",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                longText,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    mylocation();
                  });
                },
                child: const Text(
                  "Get my Location",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Google(lat: lat, lon: lon)));
                },
                child: const Text(
                  "Go To Google Maps",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
