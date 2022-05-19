import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({ Key? key, required this.title, required this.image, required this.rate }) : super(key: key);
final String title;
final String image;
final String rate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Image.asset(image)),
        const SizedBox(height: 4),
        AppText.heading6(text: rate),
        const SizedBox(height: 2),
        AppText.caption(text: title),
      ],
    );
  }
}