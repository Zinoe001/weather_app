import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/home/components/degrees.dart';
import 'package:weather_app/views/home/components/weather_card.dart';
import 'package:weather_app/views/home/components/weather_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Center(child: AppText.heading6(text: "Your Location Now")),
            const SizedBox(height: 4),
            Center(
                child: AppText.heading4(text: "Benin City,Edo State,Nigeria")),
            const SizedBox(height: 10),
            Row(
              children: [
                AppText.heading5(text: "Today's Report"),
                const Spacer(),
                AppText.small(
                  text: "View full report",
                  color: kPrimaryColor,
                ),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: kPrimaryColor,
                  size: 20,
                )
              ],
            ),
            const SizedBox(height: 30),
            const WeatherCard(),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.bold(text: "29"),
                const Degree(),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                WeatherData(
                  image: "assets/png/cloud.png",
                  rate: "23 km/h",
                  title: "Wind",
                ),
                WeatherData(
                  image: "assets/png/sun.png",
                  rate: "30%",
                  title: "Humidity",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
