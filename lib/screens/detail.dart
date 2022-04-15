import 'package:flutter/material.dart';
import 'package:proyecto/models/course.dart';
import 'package:proyecto/utils/assets.dart';

class Detail extends StatelessWidget {
  final Map map;

  const Detail({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            map['image'],
            fit: BoxFit.cover,
            height: 300,
            width: MediaQuery.of(context).size.width,
          ),
          Text(map['title'])
        ],
      ),
    );
  }
}
