import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/forecast/components/forecast_daily_card.dart';
import 'package:weather_app/widgets/skeleton.dart';

class ForecastSlide extends StatelessWidget {
   const ForecastSlide({Key? key, required this.list,}) : super(key: key);

 final Map<String,dynamic> list;
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverPinnedHeader(
          child: Container(
            color: Colors.white,
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText.heading4(text: "Today"),
              ],
            ),
          ),
        ),
              const SizedBox(height: 12),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 102,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (list["list"].length/5).truncate(),
              itemBuilder: (context, index) =>ForecastDailyCard(
                time: DateFormat("hh a").format(DateTime.fromMillisecondsSinceEpoch(list["list"][index]["dt"]*1000)),
                degree: "${(list["list"][index]["main"]["temp"] - 273).truncate()}°C",
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ForecastSlideSkeleton extends StatelessWidget {
   const ForecastSlideSkeleton({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverPinnedHeader(
          child: Container(
            color: Colors.white,
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Skeleton(
                  height: 18,
                  width: 65,
                )
              ],
            ),
          ),
        ),
              const SizedBox(height: 12),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 102,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) =>ForecastDailyCardSkelenton(
              ),
            ),
          ),
        )
      ],
    );
  }
}