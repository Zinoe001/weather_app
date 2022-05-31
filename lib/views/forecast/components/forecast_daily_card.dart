import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/widgets/skeleton.dart';

class ForecastDailyCard extends StatelessWidget {
  const ForecastDailyCard({Key? key, required this.time, required this.degree}) : super(key: key);
final String time;
final String degree;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kPrimaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText.caption(
            text: time,
            color: Colors.white,
          ),
          Container(
            height: 45,
            width: 45,
            padding: const EdgeInsets.all(5),
            child: Image.asset("assets/png/cloud.png"),
          ),
          AppText.heading6(
            text: degree,
            color: Colors.white,
          ),  
        ],
      ),
    );
  }
}


class ForecastDailyCardSkelenton extends StatelessWidget {
  const ForecastDailyCardSkelenton({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kSkelenton,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Skeleton(
           height:8,
           width: 35,
         ),
         Skeleton(
           height: 45,
           width: 45,
         ),
         
          Skeleton(
           height: 15,
           width: 55,
         ),  
        ],
      ),
    );
  }
}