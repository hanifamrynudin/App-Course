import 'package:flutter/material.dart';

class Course {
  late List<String> type;
  late String name;
  late String image;
  late String duration;
  late int modul;
  late Color color;

  Course({
    required this.color,
    required this.duration,
    required this.image,
    required this.modul,
    required this.name,
    required this.type,
  });
}
