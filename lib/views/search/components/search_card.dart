import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/widgets/skeleton.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key, required this.search}) : super(key: key);
  final Map<String, dynamic> search;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kPrimaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.heading3(
                    text: search["degree"],
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  AppText.small(
                    text: search["description"],
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                width: 35,
              ),
              Container(
                height: 55,
                width: 55,
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.all(5),
                child: Image.asset(search["image"])
              ),
            ],
          ),
          const SizedBox(height: 7),
          AppText.heading5(
            text: search["name"],
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}


class SearchCardSkeleton extends StatelessWidget {
  const SearchCardSkeleton({Key? key,}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Skeleton(height: 25,width: 45,),
                  SizedBox(
                    height: 4,
                  ),
                  Skeleton(height: 10,width: 65,),
                ],
              ),
              const SizedBox(
                width: 35,
              ),
              const Skeleton(height: 55,width: 55,)
            ],
          ),
          const SizedBox(height: 7),
          const  Skeleton(height: 15,width: 55,)
        ],
      ),
    );
  }
}
