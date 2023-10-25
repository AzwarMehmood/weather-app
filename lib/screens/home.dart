import 'dart:convert';
import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qweather_icons/qweather_icons.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map data_coming = ModalRoute.of(context)!.settings.arguments as Map;
    String wicon = data_coming["wicon_value"];
    List city_names = [
      "New York",
      "Washington",
      "London",
      "Your City",
      "Beijing",
      "Paris",
      "Moscow",
      "Islamabad"
    ];
    final _random = new Random();
    var city = city_names[_random.nextInt(city_names.length)];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: GradientAppBar(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor("#00bfff"),
                HexColor("#0073cf"),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
             // height: MediaQuery.of(context).size.height,
           //   width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    HexColor("#00bfff"),
                    HexColor("#0073cf"),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    // SearchBar Container
                    padding:
                        EdgeInsets.only(left: 15, right: 0, top: 3, bottom: 3),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if(((searchController.text).replaceAll(" ", "")).isNotEmpty) {
                              Navigator.pushReplacementNamed(
                                  context, "/", arguments: {
                                "searchText": searchController.text,
                              });
                            }
                          },
                          child: Container(
                              margin: EdgeInsets.fromLTRB(4, 0, 10, 0),
                              child: Icon(Icons.search)),
                        ),
                        Expanded(
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value){
                              if(((value).replaceAll(" ", "")).isNotEmpty) {
                                Navigator.pushReplacementNamed(
                                    context, "/", arguments: {
                                  "searchText": value,
                                });
                              }
                            },
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "Search $city",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if(((searchController.text).replaceAll(" ", "")).isNotEmpty) {
                              Navigator.pushReplacementNamed(
                                  context, "/", arguments: {
                                "searchText": searchController.text,
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(20)
                            ),
                              margin: EdgeInsets.fromLTRB(4, 0, 10, 0),
                              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                              child: Row(
                                children: [
                                  Icon(Icons.search, color: Colors.white,),
                                  Text("Search", style: TextStyle(fontSize: 16, color: Colors.white),)
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.fromLTRB(20, 5, 5, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          height: 90,
                          child: Row(
                            children: [
                              Image.network("https://openweathermap.org/img/wn/$wicon@2x.png", height: 80,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data_coming["weather_value"],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("In " + data_coming["location_name_value"], style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.fromLTRB(5, 5, 20, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          height: 90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(WeatherIcons.thermometer, size: 16,),
                                  Text("Feels Like"),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data_coming["feels_like_value"],
                                      style: TextStyle(
                                          fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 2,),
                                    Text(
                                      "\u2103",
                                      style: TextStyle(
                                          fontSize: 14,),
                                    ),
                                  ],
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          height: 220,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(WeatherIcons.thermometer, size: 30,),
                                  Text("Temprature", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(data_coming["temprature_value"], style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
                                    SizedBox(width: 2,),
                                    Text("\u2103", style: TextStyle(fontSize: 24,)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.fromLTRB(20, 10, 5, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          height: 220,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(WeatherIcons.day_light_wind, size: 25,),
                                  SizedBox(width: 10,),
                                  Text("Wind Speed", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 40.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(data_coming["windspeed_value"], style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                                    Text("KM/H", style: TextStyle(fontSize: 14,)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.fromLTRB(5, 10, 20, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          height: 220,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(WeatherIcons.humidity, size: 25,),
                                  SizedBox(width: 10,),
                                  Text("Humidity", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 40.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(data_coming["humidity_value"], style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                                    Text("Percent %", style: TextStyle(fontSize: 14,)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Text(
                          "Weather App",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Current Weather Forecast",
                          style: TextStyle(
                              fontSize: 16, color: Colors.white.withOpacity(0.9)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 27,)
                ],
              ),
            ),
          ),
        ));
  }
}
