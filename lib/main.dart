import 'package:flutter/material.dart';
import 'package:weather_app/constants/image_keys.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/functions.dart';
import 'package:weather_app/views/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


static final WeatherFunction functions = WeatherFunction();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future.wait([
      functions.loadingImage(context,ImageKeys.clear),
      functions.loadingImage(context,ImageKeys.cloud),
      functions.loadingImage(context,ImageKeys.rain),
      functions.loadingImage(context,ImageKeys.pressure),
      functions.loadingImage(context,ImageKeys.humidity),
      functions.loadingImage(context,ImageKeys.wind),
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: kPrimaryColor,
      ),
      home: SplashView(),
    );
  }
}
