import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/widgets/skeleton.dart';

class WorldForecastCard extends StatelessWidget {
  const WorldForecastCard({
    Key? key,
    required this.title,
    required this.weather,
    required this.temp, required this.image,
  }) : super(key: key);
  final String title;
  final String weather;
  final String temp;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.heading4(
                  text: title,
                  color: Colors.white,
                ),
                const SizedBox(height: 18),
                AppText.heading6(
                  text: weather,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(image),
                ),
                const SizedBox(height: 18),
                AppText.heading6(
                  text: temp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class WorldForecastCardSkeleton extends StatelessWidget {
  const WorldForecastCardSkeleton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Skeleton(
                  height: 25,
                  width: 65,
                ),
                SizedBox(height: 18),
                Skeleton(
                  height: 25,
                  width: 85,
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Skeleton(
                  height: 55,
                  width: 55,
                ),
                SizedBox(height: 18),
                 Skeleton(
                  height: 15,
                  width: 35,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
