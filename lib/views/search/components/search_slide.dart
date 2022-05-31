import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/search/components/search_card.dart';

class SearchSlide extends StatelessWidget {
  SearchSlide({
    Key? key,
    required this.item,
  }) : super(key: key);
  late List<Map<String, dynamic>> item;
  late List<Map<String, dynamic>> previousItem = item.reversed.toList();
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
                AppText.heading6(text: "Previously Searched on"),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 115,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: previousItem.length,
              itemBuilder: (context, index) => SearchCard(
                search: previousItem[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}

// class SearchSlideSkeleton extends StatelessWidget {
//   SearchSlideSkeleton({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MultiSliver(
//       children: [
//         const SliverPinnedHeader(
//             child: Skeleton(
//           height: 25,
//           width: 75,
//         )),
//         SliverToBoxAdapter(
//           child: SizedBox(
//             height: 115,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 3,
//                 itemBuilder: (context, index) => const SearchCardSkeleton()),
//           ),
//         ),
//       ],
//     );
//   }
// }
