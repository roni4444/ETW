import 'package:etw/data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Data {
  final flutterReactiveBle = FlutterReactiveBle();
  void scan() {
    flutterReactiveBle.scanForDevices(
      withServices: [],
      scanMode: ScanMode.lowLatency,
      requireLocationServicesEnabled: true,
    ).listen(
      (device) {
        if (kDebugMode && device.name != "") {
          print(device.name);
          print(device.id);
          print(device.manufacturerData);
          print(device.rssi);
          print("object");
        }
      },
    );
    if (kDebugMode) {}
  }

  void bluetoothUpdate() {
    Object? data;
    DatabaseReference bluetoothState = FirebaseDatabase.instance.ref('ETW/Bluetooth/State');
    bluetoothState.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
      if (kDebugMode) {
        print(data);
      }
      int x = int.parse(data.toString());
      if (kDebugMode) {
        print(x);
      }
      setState(() {
        Data.etwBluetoothState = x;
        if (x == 2) {
          Data.helmetBluetoothState = 2;
        }
      });
    });
  }

  void engineUpdate() {
    Object? data;
    DatabaseReference engineState = FirebaseDatabase.instance.ref('ETW/Engine/State');
    engineState.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
      if (kDebugMode) {
        print(data);
      }
      int x = int.parse(data.toString());
      if (kDebugMode) {
        print(x);
      }
      setState(() {
        Data.etwEngineState = x;
      });
    });
  }

  void epbUpdate() {
    Object? data;
    DatabaseReference epbState = FirebaseDatabase.instance.ref('ETW/EPB/State');
    epbState.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
      if (kDebugMode) {
        print(data);
      }
      int x = int.parse(data.toString());
      if (kDebugMode) {
        print(x);
      }
      setState(() {
        Data.etwEPBState = x;
      });
    });
  }

  void checkUpdate() {
    Object? data;
    DatabaseReference bluetoothState = FirebaseDatabase.instance.ref('ETW/Check/State');
    bluetoothState.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
      if (kDebugMode) {
        print(data);
      }
      int x = int.parse(data.toString());
      if (kDebugMode) {
        print(x);
      }
      setState(() {
        Data.etwBluetoothState = x;
        if (x == 2) {
          Data.helmetBluetoothState = 2;
        }
      });
    });
  }

  void proximityUpdate() {
    Object? data;
    DatabaseReference proximityState = FirebaseDatabase.instance.ref('ETW/Proximity/State');
    proximityState.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
      if (kDebugMode) {
        print(data);
      }
      int x = int.parse(data.toString());
      if (kDebugMode) {
        print(x);
      }
      setState(() {
        Data.helmetProximityState = x;
      });
    });
  }

  void orientationUpdate() {
    Object? data;
    DatabaseReference orientationState = FirebaseDatabase.instance.ref('ETW/Orientation/State');
    orientationState.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
      if (kDebugMode) {
        print(data);
      }
      int x = int.parse(data.toString());
      if (kDebugMode) {
        print(x);
      }
      setState(() {
        Data.helmetOrientationState = x;
      });
    });
  }

  void connectionUpdate() {
    Object? data;
    DatabaseReference connectionState = FirebaseDatabase.instance.ref('ETW/Connection/State');
    connectionState.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
      if (kDebugMode) {
        print(data);
      }
      int x = int.parse(data.toString());
      if (kDebugMode) {
        print(x);
      }
      setState(() {
        Data.helmetConnectionState = x;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ETW Dashboard"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "Electronic Two Wheeler",
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Text(
                      "Smart Helmet",
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ListTile(
                        leading: const FaIcon(
                          FontAwesomeIcons.bluetooth,
                          color: Colors.blue,
                        ),
                        title: const Text(
                          "Bluetooth",
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          Data.bluetoothText[Data.etwBluetoothState],
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Data.bluetoothColor[Data.etwBluetoothState],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ListTile(
                        leading: const FaIcon(
                          FontAwesomeIcons.bluetooth,
                          color: Colors.blue,
                        ),
                        title: const Text(
                          "Bluetooth",
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          Data.bluetoothText[Data.helmetBluetoothState],
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Data.bluetoothColor[Data.helmetBluetoothState],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              /*ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300.0, 100.0),
                ),
                onPressed: () {
                  scan();
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => const Gps()));
                },
                child: const Text(
                  "Connect",
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),*/
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: ListTile(
                        leading: const FaIcon(
                          FontAwesomeIcons.check,
                          color: Colors.lightGreenAccent,
                        ),
                        title: const Text(
                          "Engine",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          Data.engineText[Data.etwEngineState],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Data.engineColor[Data.etwEngineState],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: ListTile(
                        leading: const FaIcon(
                          FontAwesomeIcons.check,
                          color: Colors.lightGreenAccent,
                        ),
                        title: const Text(
                          "Proximity",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          Data.proximityText[Data.helmetProximityState],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Data.proximityColor[Data.helmetProximityState],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: ListTile(
                        leading: const FaIcon(
                          FontAwesomeIcons.check,
                          color: Colors.lightGreenAccent,
                        ),
                        title: const Text(
                          "EPB",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          Data.epbText[Data.etwEPBState],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Data.epbColor[Data.etwEPBState],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: ListTile(
                        leading: const FaIcon(
                          FontAwesomeIcons.check,
                          color: Colors.lightGreenAccent,
                        ),
                        title: const Text(
                          "Orientation",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          Data.orientationText[Data.helmetOrientationState],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Data.orientationColor[Data.helmetOrientationState],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: ListTile(
                        leading: const FaIcon(
                          FontAwesomeIcons.check,
                          color: Colors.lightGreenAccent,
                        ),
                        title: const Text(
                          "Check",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          Data.checkText[Data.etwCheckState],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Data.checkColor[Data.etwCheckState],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: ListTile(
                        leading: const FaIcon(
                          FontAwesomeIcons.check,
                          color: Colors.lightGreenAccent,
                        ),
                        title: const Text(
                          "Connection",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          Data.connectionText[Data.helmetConnectionState],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Data.connectionColor[Data.helmetConnectionState],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    bluetoothUpdate();
  }
}
