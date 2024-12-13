import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/screens/explorer.dart';
import 'package:wisata_mobile_5/screens/homescreen.dart';
import 'package:wisata_mobile_5/screens/splashscreens.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
