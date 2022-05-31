import 'package:flutter/cupertino.dart';
import 'package:weather_app/constants/image_keys.dart';
import 'package:weather_app/services/preferences_services.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/widgets/my_list.dart';

class WeatherFunction {
  final WeatherServices _services = WeatherServices();
  Map<String, dynamic> currentData = {};
  Map<String, dynamic> dailyData = {};
  Map<String, dynamic> weeklyData = {};
  Map<String, dynamic> searchData = {};
  Map<String, dynamic> worldData = {};
  List<Map<String, dynamic>> worldDataList = [];
  List<Map<String, dynamic>> slideList = [];
  List<Map<String, dynamic>> savedList = [];
  final MyList list = MyList();
  final PreferencesServices _prefs = PreferencesServices();

  currentForecast({required String query}) async {
    print("trying to fetch data");
    currentData = await _services.getCurrentForecast(q: query);
    print(currentData);
    print("Data gotten successful");
  }

  dailyForecast({required String query}) async {
    print("trying to fetch List of dailydata");
    dailyData = await _services.getDailyForecast(q: query);
    print(dailyData);
    print("List of dailydata gotten successful");
  }

  weeklyForecast({required String query}) async {
    print("trying to fetch List of weeklydata");
    weeklyData = await _services.getWeeklyForecast(q: query);
    print(weeklyData);
    print("List of weeklydata gotten successful");
  }
 
  searchForecast({required String query}) async {
    print("trying to fetch data");
    searchData = await _services.getCurrentForecast(q: query);
    print(searchData);
    slideList.add(searchData);
    print("Data gotten successful");
  }

  worldForecast() async {
    print("trying to fetch data");
    await getWorldList();
    print("Data gotten successful");
  }

  getWorldList() async {
    print("starting the loop");
    for (var city in list.city) {
      worldData = await _services.getCurrentForecast(q: city);
      worldDataList.add(worldData);
      print(worldDataList);
    }
    print("ending the loop");
  }
  
  // Displays images based on the condition
  getCondition({required String condition}) {
    switch (condition) {
      case "Clear":
        return ImageKeys.clear;
      case "Rain":
        return ImageKeys.rain;
      case "Clouds":
        return ImageKeys.cloud;
      default:
    }
  }

  getSaved() async {
    await _prefs.init();
    print("getting data from saved searched list");
    savedList.addAll(_prefs.searchedList);  
  }

  // function to get data from item list
  // and add to preferenceSavedItem list
  add({required List<Map<String,dynamic>> item}) {
    print("taking data");
    _prefs.saveSearchedList(item);
    print(item);
    print("done");
  }

  // function to delete that particular dataItem
  // from the list of data in item list
  // and preferenceSavedItem list
  remove(index,{required List<Map<String,dynamic>> item}) {
    print("Deleting");
      item.remove(item[index]);
      _prefs.saveSearchedList(item);
    print("done");
  }

  // Preloads assest image as the app is running
  Future<Image> loadingImage(BuildContext context, String path) async {
    var image = Image.asset(path);
    await precacheImage(image.image, context);
    return image;
  }
}
