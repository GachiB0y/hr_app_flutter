import 'package:flutter/widgets.dart';

const String host =
    'http://10.3.50.98'; //'http://10.3.29.20'  'https://apihuntflow.grass.su'
const String port = ':8888'; //':9100'
const String urlAdress = '$host$port';

class MyCustomIcon {
  static const IconData iconLogoGrass =
      IconData(0xe803, fontFamily: 'myCustomIcons');
  static const IconData iconHome =
      IconData(0xe800, fontFamily: 'myCustomIcons');
  static const IconData iconRub = IconData(0xe802, fontFamily: 'myCustomIcons');
  static const IconData iconBook =
      IconData(0xe801, fontFamily: 'myCustomIcons');
  static const IconData iconService =
      IconData(0xe804, fontFamily: 'myCustomIcons');
}
