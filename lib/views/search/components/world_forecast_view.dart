import 'package:flutter/material.dart';
import 'package:weather_app/utils/functions.dart';
import 'package:weather_app/views/search/components/world_forecast_card.dart';

class WorldForecastView extends StatefulWidget {
  const WorldForecastView({
    Key? key,
  }) : super(key: key);
  @override
  State<WorldForecastView> createState() => _WorldForecastViewState();
}

class _WorldForecastViewState extends State<WorldForecastView> {
  static final WeatherFunction functions = WeatherFunction();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => worldForcast());
    setState(() {});
    super.initState();
  }

  worldForcast() async {
    await functions.worldForecast();
    setStateIfMounted(() {
      functions.worldDataList;
    });
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  Widget build(BuildContext context) {
    return functions.worldDataList.isEmpty
        ? const WorldForecastViewSkeleton()
        : Column(
            children: [
              ...List.generate(
                  functions.worldDataList.length,
                  (index) => WorldForecastCard(
                        image: functions.getCondition(
                            condition: functions.worldDataList[index]["weather"]
                                [0]["main"]),
                        temp:
                            "${(functions.worldDataList[index]["main"]["temp"] - 273).truncate()}°C",
                        title: functions.worldDataList[index]["name"],
                        weather: functions.worldDataList[index]["weather"][0]
                            ["description"],
                      ))
            ],
          );
  }
}

class WorldForecastViewSkeleton extends StatelessWidget {
  const WorldForecastViewSkeleton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(6, (index) => const WorldForecastCardSkeleton())
      ],
    );
  }
}
