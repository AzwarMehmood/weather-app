import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';

import '../DataWork/get_data.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Lahore";
  String Humidity = "";
  String Temprature = "";
  String Weather = "";
  String WeatherIcon = "";
  String WindSpeed = "";
  String Feels_Like = "";
  String location_name = "";

  void checkData() async {
    GetData data_object;
    data_object = GetData(location: city);
    await data_object.getData();

    Weather = data_object.main_weather;
    WeatherIcon  = data_object.wicon;
    Humidity = data_object.humidity;
    Temprature = data_object.temp;
    WindSpeed = data_object.wind_speed;
    Feels_Like = data_object.feels_like;
    location_name = data_object.name;

    Future.delayed(Duration(microseconds: 1500), (){
      Navigator.pushReplacementNamed(context, "/Home", arguments: {
        "weather_value": Weather,
        "wicon_value": WeatherIcon,
        "humidity_value": Humidity,
        "temprature_value": Temprature,
        "windspeed_value": WindSpeed,
        "feels_like_value": Feels_Like,
        "location_name_value": location_name,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if(search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    checkData();

    return Scaffold(
      backgroundColor: HexColor("#5ececd"),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", height: 190,),
                SizedBox(height: 40,),
                Text(
                  "Weather App",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: HexColor("#FFFFFF"),),
                ),
                //Text("Made by Azwar Mehmood", style: TextStyle(fontSize: 15),),
                SpinKitThreeInOut(
                  color: HexColor("#FFFFFF"),
                  size: 70.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
