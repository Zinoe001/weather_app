import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText.heading1(
                text: "Update coming soon 👍🤘🤩",
                centered: true,
                multilines: true,
              )
            ]),
      ),
    );
  }
}
