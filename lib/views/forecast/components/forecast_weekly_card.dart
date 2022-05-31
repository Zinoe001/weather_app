import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/widgets/skeleton.dart';

class WeeklyForecastCard extends StatelessWidget {
  const WeeklyForecastCard(
      {Key? key, required this.day, required this.month, required this.degree})
      : super(key: key);
  final String day;
  final String month;
  final String degree;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        // color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.heading5(
                text: day,
              ),
              const SizedBox(height: 4),
              AppText.heading6(
                text: month,
                color: kAccentColor.shade500,
              ),
            ],
          ),
          const SizedBox(width: 55),
          AppText.heading3(
            text: degree,
          ),
          const Spacer(),
          Container(
            height: 55,
            width: 55,
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.all(5),
            child: Image.asset("assets/png/cloud.png"),
          ),
        ],
      ),
    );
  }
}

class WeeklyForecastCardSkelenton extends StatelessWidget {
  const WeeklyForecastCardSkelenton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: kSkelenton,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(
                height: 20,
                width: 75,
              ),
              const SizedBox(height: 4),
              Skeleton(
                height: 20,
                width: 65,
              ),
            ],
          ),
          const SizedBox(width: 55),
          Skeleton(
            height: 18,
            width: 35,
          ),
          const Spacer(),
          Skeleton(
            height: 55,
            width: 55,
          )
        ],
      ),
    );
  }
}
