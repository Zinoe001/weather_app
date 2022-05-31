import 'package:flutter/material.dart';
import 'package:weather_app/utils/functions.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/forecast/components/forecast_list.dart';
import 'package:weather_app/views/forecast/components/forecast_slide.dart';
import 'package:weather_app/widgets/skeleton.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView> {
  static final WeatherFunction functions = WeatherFunction();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => forcast());
    super.initState();
  }

  forcast() async {
    await functions.dailyForecast(
      query: widget.query,
    );
    await functions.weeklyForecast(
      query: widget.query,
    );
    setState(() {
      functions.dailyData;
      functions.weeklyData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: functions.dailyData.isEmpty
            ? ForecastViewSkelenton()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child:
                                  const Icon(Icons.arrow_back_ios_new_outlined),
                            ),
                          ),
                          const SizedBox(width: 75),
                          AppText.heading2(
                              text: functions.dailyData["city"]["name"]),
                        ],
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 25),
                    ),
                    ForecastSlide(
                      list: functions.dailyData,
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 5),
                    ),
                    ForecastList(
                      list: functions.weeklyData,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class ForecastViewSkelenton extends StatelessWidget {
  const ForecastViewSkelenton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                    ),
                    const SizedBox(width: 75),
                    Skeleton(
                      height: 25,
                      width: 95,
                    )
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 25),
              ),
              ForecastSlideSkeleton(),
              const SliverToBoxAdapter(
                child: SizedBox(height: 5),
              ),
              ForecastListSkelenton(),
            ],
          ),
        ),
      ),
    );
  }
}
