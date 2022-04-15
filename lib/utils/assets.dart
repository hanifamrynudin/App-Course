import 'package:flutter/material.dart';
import 'package:proyecto/models/course.dart';

class Assets {
  static const imageAvatar = 'assets/avatar.png';
  static const header = 'assets/header.png';
  static const backend = 'assets/backend.png';
  static const fontApp = TextStyle(fontFamily: 'GT Walsheim Pro Trial');

  static final menuCourse = [
  {
    'title' : 'Backend',
    'image' : 'assets/backend.png',
    'modul' : 4,
  },
  {
    'title' : 'Frontend',
    'image' : 'assets/frontend.png',
    'modul' : 12,
  },
  {
    'title' : 'Backend',
    'image' : 'assets/backend.png',
    'modul' : 4,
  },
  {
    'title' : 'Frontend',
    'image' : 'assets/frontend.png',
    'modul' : 12,
  },
  ];

  static final proffesor = [
    'assets/prof1.png',
    'assets/prof2.png',
    'assets/prof3.png',
    'assets/prof4.png',
  ];

  static final List<Course> courses = [
    Course(
      color: Colors.cyan[200]!,
      duration: '8 Hour 2 Min',
      image: 'assets/logo_angular.png',
      modul: 17,
      name: 'Angular',
      type: ['Frontend'],
    ),
    Course(
      color: Colors.green[200]!,
      duration: '5 Hour 2 Min',
      image: 'assets/logo_bootstrap.png',
      modul: 17,
      name: 'Bootstrap',
      type: ['Frontend'],
    ),
    Course(
      color: Colors.blue[200]!,
      duration: '8 Hour 2 Min',
      image: 'assets/logo_javascript.png',
      modul: 17,
      name: 'Javascript',
      type: ['Frontend', 'Backend'],
    ),
    Course(
      color: Colors.red[200]!,
      duration: '8 Hour 2 Min',
      image: 'assets/logo_responsive_design.png',
      modul: 17,
      name: 'Responsive Design',
      type: ['Frontend'],
    ),
    Course(
      color: Colors.orange[200]!,
      duration: '8 Hour 2 Min',
      image: 'assets/logo_web_development.png',
      modul: 17,
      name: 'Web Development',
      type: ['Frontend', 'Backend'],
    ),
  ];

  
}