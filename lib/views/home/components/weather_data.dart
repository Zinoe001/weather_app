import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/widgets/skeleton.dart';

class WeatherData extends StatelessWidget {
  const WeatherData(
      {Key? key, required this.title, required this.image, required this.rate})
      : super(key: key);
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
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 4),
        AppText.heading6(text: rate),
        const SizedBox(height: 2),
        AppText.caption(text: title),
      ],
    );
  }
}


class WeatherDataSkeleton extends StatelessWidget {
  const WeatherDataSkeleton(
      {Key? key,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Skeleton(
          height: 55,
          width: 55,
        ),
        SizedBox(height: 4),
        Skeleton(
          height: 13,
          width: 85,
        ),
       SizedBox(height: 2),
        Skeleton(
          height: 8,
          width: 35,
        )
      ],
    );
  }
}