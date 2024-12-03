import 'package:flutter/material.dart';

class LandingModel {
  ImageProvider image; 
  String name;

  LandingModel({required this.image, required this.name});
}

List<LandingModel> landingpage = [
  LandingModel(image: AssetImage("assets/images/merah.jpg"), name: 'Martabak'),
  LandingModel(image: AssetImage("assets/images/kuning.jpeg"), name: 'Pecel Lele'), 
  LandingModel(image: AssetImage("assets/images/hijau.jpeg"), name: 'Gorengan'), 
];
