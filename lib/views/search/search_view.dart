import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            Center(
              child: AppText.heading2(text: "Pick Location"),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AppText.heading6(
                text:
                    "Find the area or city that you want to know the detailed weather info at this time",
                centered: true,
                multilines: true,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
