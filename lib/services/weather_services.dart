import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherServices {

 Future<Map<String,dynamic>> getCurrentForecast( {required String q}) async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(
          Uri.parse("https://community-open-weather-map.p.rapidapi.com/weather?q=$q"),
          headers: {
            "X-RapidAPI-Host": "community-open-weather-map.p.rapidapi.com",
            "X-RapidAPI-Key": "a9a7c99642msh32166c17e9cec91p1c0a10jsnd06beab71c87",
          });
      final currentData = jsonDecode(response.body);
      print("finished with services");
      return currentData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Map<String,dynamic>> getDailyForecast({required String q}) async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(
          Uri.parse(
              "https://community-open-weather-map.p.rapidapi.com/forecast?q=$q"),
          headers: {
            "X-RapidAPI-Host": "community-open-weather-map.p.rapidapi.com",
            "X-RapidAPI-Key":
                "a9a7c99642msh32166c17e9cec91p1c0a10jsnd06beab71c87",
          });
      final dailyData = jsonDecode(response.body);
      print("finished with services");
      // log(dailyData);
      return dailyData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

 Future<Map<String,dynamic>> getWeeklyForecast({required String q}) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              "https://community-open-weather-map.p.rapidapi.com/forecast/daily?q=$q"),
          headers: {
            "X-RapidAPI-Host": "community-open-weather-map.p.rapidapi.com",
            "X-RapidAPI-Key":"a9a7c99642msh32166c17e9cec91p1c0a10jsnd06beab71c87",
          });
      final weeklyData = jsonDecode(response.body);
      print("finished with services");
      return weeklyData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Map<String,dynamic>> getMonthlyForecast({required String q}) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              "https://community-open-weather-map.p.rapidapi.com/climate/month?q=$q"),
          headers: {
            "X-RapidAPI-Host": "community-open-weather-map.p.rapidapi.com",
            "X-RapidAPI-Key":
                "a9a7c99642msh32166c17e9cec91p1c0a10jsnd06beab71c87",
          });
      final monthlyData = jsonDecode(response.body);
      print("finished with services");
      return monthlyData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
