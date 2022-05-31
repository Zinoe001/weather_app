import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/views/forecast/components/forecast_weekly_card.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({Key? key, required this.list}) : super(key: key);
  final Map<String, dynamic> list;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => WeeklyForecastCard(
            day: DateFormat("EEEE").format(DateTime.fromMillisecondsSinceEpoch(
                list["list"][index]["dt"] * 1000)),
            month: DateFormat("dd MMM").format(
                DateTime.fromMillisecondsSinceEpoch(
                    list["list"][index]["dt"] * 1000)),
            degree:
                "${(list["list"][index]["temp"]["day"] - 273).truncate()}°C"),
        childCount: list["list"].length,
      ),
    );
  }
}

class ForecastListSkelenton extends StatelessWidget {
  const ForecastListSkelenton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => WeeklyForecastCardSkelenton(),
        childCount: 6,
      ),
    );
  }
}
