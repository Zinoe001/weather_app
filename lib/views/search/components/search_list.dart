import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/search/components/world_forecast_view.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    Key? key,
  }) : super(key: key);
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
                AppText.heading6(text: "Around the World"),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: WorldForecastView(),
        )
      ],
    );
  }
}
