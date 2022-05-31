import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/widgets/skeleton.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key, required this.description, required this.image}) : super(key: key);
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image),
        Positioned(
          bottom: 5,
          left: 1,
          right: 1,
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.4)),
                child: AppText.buttton(
                  text: description,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}


class WeatherCardSkeleton extends StatelessWidget {
  const WeatherCardSkeleton({Key? key,}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         const Skeleton(height: 275, width: 343,),
        Positioned(
          bottom: 10,
          left: 1,
          right: 1,
          child: Column(
            children: const [
              Skeleton(height: 45, width: 95,),
            
            ],
          ),
        )
      ],
    );
  }
}