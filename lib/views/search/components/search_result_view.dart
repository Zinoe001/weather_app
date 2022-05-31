import 'package:flutter/material.dart';
import 'package:weather_app/constants/image_keys.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/functions.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/forecast/forecast_view.dart';
import 'package:weather_app/views/home/components/weather_card.dart';
import 'package:weather_app/views/home/components/weather_data.dart';
import 'package:weather_app/views/search/search_view.dart';
import 'package:weather_app/widgets/skeleton.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({Key? key, required this.query, required this.getData})
      : super(key: key);
  static final WeatherFunction functions = WeatherFunction();
  final String query;
  final Function(Map<String, dynamic>) getData;

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  static final WeatherFunction functions = WeatherFunction();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => searchforcast());
    setState(() {});
    super.initState();
  }

  searchforcast() async {
    await functions.searchForecast(query: widget.query);
    setState(() {
      functions.searchData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: functions.searchData.isEmpty
            ? const SearchResultViewSkeleton()
            : ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.getData(
                            {
                              "name": functions.searchData["name"],
                              "image": functions.getCondition(
                                  condition: functions.searchData["weather"][0]
                                      ["main"]),
                              "description": functions.searchData["weather"][0]
                                  ["description"],
                              "degree":
                                  "${(functions.searchData["main"]["temp"] - 273).truncate()}°C"
                            },
                          );
                          functions.searchData.clear();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => SearchView(),
                            ), //if you want to disable back feature set to false
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.arrow_back_ios_new_outlined),
                        ),
                      ),
                      const SizedBox(width: 65),
                      Column(
                        children: [
                          Center(
                              child:
                                  AppText.heading6(text: "Searched Location")),
                          const SizedBox(height: 4),
                          Center(
                              child: AppText.heading4(
                                  text: functions.searchData["name"])),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      AppText.heading5(text: "Today's Report"),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForecastView(
                                      query: widget.query,
                                    ))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
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
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  WeatherCard(
                      image: functions.getCondition(
                          condition: functions.searchData["weather"][0]
                              ["main"]),
                      description: functions.searchData["weather"][0]
                          ["description"]),
                  const SizedBox(height: 25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.bold(
                          text:
                              "${(functions.searchData["main"]["temp"] - 273).truncate()}°C"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherData(
                        image: ImageKeys.wind,
                        rate: "${(functions.searchData["wind"]["speed"])}km/h",
                        title: "Wind",
                      ),
                      WeatherData(
                        image: ImageKeys.pressure,
                        rate:
                            "${(functions.searchData["main"]["pressure"] / 1013 * 760).truncate()}mmHg",
                        title: "Pressure",
                      ),
                      WeatherData(
                        image: ImageKeys.humidity,
                        rate: "${functions.searchData["main"]["humidity"]}%",
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


class SearchResultViewSkeleton extends StatelessWidget {
  const SearchResultViewSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const Center(
              child: Skeleton(
                height: 15,
                width: 115,
              ),
            ),
            const SizedBox(height: 4),
            const Center(
              child: Skeleton(
                height: 25,
                width: 225,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                 Skeleton(
                  height: 20,
                  width: 95,
                ),
                Spacer(),
                Skeleton(
                  height: 20,
                  width: 65,
                ),
              ],
            ),
            const SizedBox(height: 30),
           const  WeatherCardSkeleton(),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 Skeleton(height: 55,width: 95,)
              ]
            ),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const[
                WeatherDataSkeleton(),
                WeatherDataSkeleton(),
                WeatherDataSkeleton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}