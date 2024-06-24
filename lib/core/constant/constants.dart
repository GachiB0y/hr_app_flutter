import 'package:flutter/widgets.dart';

const String host =
    'https://grass-app-api.grass.su'; //'http://10.3.50.96'  'https://grass-app-api.grass.su'
const String port = ''; //':9100'
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

class HRAppCustomIcon {
  static const IconData iconService =
      IconData(0xe800, fontFamily: 'hrAppFonts');
  static const IconData iconCoin = IconData(0xe803, fontFamily: 'hrAppFonts');
  static const IconData iconHome = IconData(0xe801, fontFamily: 'hrAppFonts');
  static const IconData iconArrowBack =
      IconData(0xe802, fontFamily: 'hrAppFonts');
  static const IconData iconExclamationMark =
      IconData(0xe804, fontFamily: 'hrAppFonts');
  static const IconData iconEducation =
      IconData(0xe805, fontFamily: 'hrAppFonts');
}
