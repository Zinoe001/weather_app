import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/png/cloud.png"),
        Positioned(
          bottom: 5,
          left: 1,
          right: 1,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.4)
          ),
          child: AppText.buttton(text: "It's Cloudy",color: Colors.white,),
        ),
              ],
            ),
        )
      ],
    );
  }
}
