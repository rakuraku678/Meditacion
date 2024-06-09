import 'package:flutter/material.dart';

class SongModel {
  String name;
  String bgImage;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  SongModel(
      {required this.name,
      required this.bgImage,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxColor,
      required this.viewIsSelected});

  static List<SongModel> getSongs() {
    List<SongModel> diets = [];

    diets.add(SongModel(
        name: 'Honey Pancake',
        bgImage: 'assets/bgs/zen1.jpeg',
        level: 'Easy',
        duration: '30mins',
        calorie: '180kCal',
        viewIsSelected: true,
        boxColor: const Color(0xff9DCEFF)));

    diets.add(SongModel(
        name: 'Canai Bread',
        bgImage: 'assets/bgs/zen1.jpeg',
        level: 'Easy',
        duration: '20mins',
        calorie: '230kCal',
        viewIsSelected: false,
        boxColor: const Color(0xffEEA4CE)));

    return diets;
  }
}
