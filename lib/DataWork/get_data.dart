import 'dart:convert';
import 'package:http/http.dart';

class GetData{
  String location = "";
  String temp = "";
  String humidity = "";
  String wind_speed = "";
  String main_weather = "";
  String wicon = "";
  String feels_like = "";
  String name = "";

  GetData({required this.location}){
    location = this.location;
  }

  Future<void> getData() async{
    try{
      Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=53fe90337e08d3947e6ffb02e85610af"));
      Map weather_data = jsonDecode(response.body);

      //To get Temprature,Humidity
      Map main_weather_data = weather_data["main"];
      var get_temp = (main_weather_data["temp"] -273.15).toInt();
      String get_humidity = main_weather_data["humidity"].toString();
      var get_feels = (main_weather_data["feels_like"] -273.15).toInt();

      //To get Main Weather, Description
      List weather_weather_data = weather_data["weather"];
      Map mainweather = weather_weather_data[0];
      String get_main_weather = mainweather["main"];
      String get_wicon = mainweather["icon"];

      //To get Wind Speed
      Map wind_weather_data = weather_data["wind"];
      double get_wind_speed = wind_weather_data["speed"]*3.6;

      //To get Name
      String location_name = weather_data["name"];

      //Assigning Values
      temp = get_temp.toString();
      humidity = get_humidity;
      wind_speed = get_wind_speed.toStringAsFixed(1);
      main_weather = get_main_weather;
      wicon = get_wicon;
      feels_like = get_feels.toString();
      name =location_name;
    }
    catch(e){
      temp = "N/A";
      humidity = "N/A";
      wind_speed = "N/A";
      main_weather = "Can't Find Data";
      wicon = "10d";
      feels_like = "N/A";
      name ="searched location";
    }

  }
}
