import 'package:flutter/material.dart';

class Data {
  static final List<String> bluetoothText = ["Disconnected", "Searching", "Connected"];
  static final List<Color> bluetoothColor = [Colors.red, Colors.white, Colors.green];
  static final List<String> engineText = ["OFF", "NEUTRAL", "READY"];
  static final List<Color> engineColor = [Colors.red, Colors.white, Colors.green];
  static final List<String> epbText = ["APPLIED", "TRANSITION", "RELEASED"];
  static final List<Color> epbColor = [Colors.red, Colors.white, Colors.green];
  static final List<String> checkText = ["NOT STARTED", "CHECKING", "COMPLETE"];
  static final List<Color> checkColor = [Colors.red, Colors.white, Colors.green];
  static final List<String> proximityText = ["UNDETECTED", "DETECTING", "HEAD DETECTED"];
  static final List<Color> proximityColor = [Colors.red, Colors.white, Colors.green];
  static final List<String> orientationText = ["NOT WORN", "CHECKING", "UPRIGHT"];
  static final List<Color> orientationColor = [Colors.red, Colors.white, Colors.green];
  static final List<String> connectionText = ["lOW", "OPTIMAL", "STRONG"];
  static final List<Color> connectionColor = [Colors.red, Colors.white, Colors.green];
  static int etwBluetoothState = 0;
  static int helmetBluetoothState = 1;
  static int etwEngineState = 0;
  static int etwEPBState = 0;
  static int etwCheckState = 0;
  static int helmetProximityState = 0;
  static int helmetOrientationState = 0;
  static int helmetConnectionState = 0;
}
