import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/screens/loading.dart';
import 'package:weather_app/screens/location.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) => Loading(),
      "/Home" : (context) => Home(),
      "/Location" : (context) => Location(),
    },
  ));
}
