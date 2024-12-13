import 'package:flutter/material.dart';

class LandingModel {
  ImageProvider image; 
  String name;

  LandingModel({required this.image, required this.name});
}

List<LandingModel> landingpage = [
  LandingModel(image: AssetImage("assets/images/martabak.jpeg"), name: 'Martabak'),
  LandingModel(image: AssetImage("assets/images/pecellele.jpg"), name: 'Pecel Lele'), 
  LandingModel(image: AssetImage("assets/images/gorengan.jpg"), name: 'Gorengan'), 
];
