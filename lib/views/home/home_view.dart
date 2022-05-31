import 'package:flutter/material.dart';
import 'package:weather_app/constants/image_keys.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/functions.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/forecast/forecast_view.dart';
import 'package:weather_app/views/home/components/weather_card.dart';
import 'package:weather_app/views/home/components/weather_data.dart';
import 'package:weather_app/widgets/skeleton.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static final WeatherFunction functions = WeatherFunction();
  final String home = "Benin";
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => currentLocation());
    super.initState();
  }

  currentLocation() async {
    await functions.currentForecast(query: home);
    setStateIfMounted(() {
      functions.currentData;
    });
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: functions.currentData.isEmpty
            ? const HomeViewSkeleton()
            : ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Center(child: AppText.heading6(text: "Your Location Now")),
                  const SizedBox(height: 4),
                  Center(
                      child: AppText.heading4(
                          text: "Benin City,Edo State,Nigeria")),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      AppText.heading5(text: "Today's Report"),
                      const Spacer(),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ForecastView(query: home))),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherCard(
                        description: functions.currentData["weather"][0]
                            ["description"],
                        image: functions.getCondition(
                            condition: functions.currentData["weather"][0]
                                ["main"]),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.bold(
                              text:
                                  "${(functions.currentData["main"]["temp"] - 273).truncate()}°C"),
                          // const Degree(),
                        ],
                      ),
                      const SizedBox(height: 45),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          WeatherData(
                            image: ImageKeys.wind,
                            rate:
                                "${(functions.currentData["wind"]["speed"])}km/h",
                            title: "Wind",
                          ),
                          WeatherData(
                            image: ImageKeys.pressure,
                            rate:
                                "${(functions.currentData["main"]["pressure"] / 1013 * 760).truncate()}mmHg",
                            title: "Pressure",
                          ),
                          WeatherData(
                            image: ImageKeys.humidity,
                            rate:
                                "${functions.currentData["main"]["humidity"]}%",
                            title: "Humidity",
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}

class HomeViewSkeleton extends StatelessWidget {
  const HomeViewSkeleton({Key? key}) : super(key: key);

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
            const WeatherCardSkeleton(),
            const SizedBox(height: 10),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Skeleton(
                    height: 55,
                    width: 95,
                  )
                ]),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
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
