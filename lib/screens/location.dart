import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton.icon(onPressed: () {
          Navigator.pushNamed(context, "/");
        }, icon: Icon(Icons.location_city_outlined),
            label: Text("At Location Page")),
      ),
    );
  }
}
