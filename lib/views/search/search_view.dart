import 'package:flutter/material.dart';
import 'package:weather_app/services/preferences_services.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/search/components/search_list.dart';
import 'package:weather_app/views/search/components/search_result_view.dart';
import 'package:weather_app/views/search/components/search_slide.dart';
import 'package:weather_app/widgets/app_text_field.dart';
class SearchView extends StatefulWidget {
  SearchView({Key? key, })
      : super(key: key);
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  final PreferencesServices _prefs = PreferencesServices();
 List<Map<String, dynamic>> list = [];

  @override
  void initState() {
    getSaved();
    setState(() {});
    super.initState();
  }

  // addSlide() {
  //   print(widget.currentItem);
  //   if (widget.currentItem.isEmpty) {
  //     getSaved();
  //   } else {
  //     list.addAll(widget.currentItem);
  //     print(list);
  //   }
  //   list.insertAll(0, list);
  //   print(list);
  //   functions.add(item: list);
  //   // list = widget.saveItem + widget.currentItem;
  //   // list =  List.from(widget.saveItem)..addAll(widget.currentItem);
  // }

getSaved()async{
await _prefs.init();
    setState((){
      print("getting data from saved list");
       list.insertAll(0,_prefs.searchedList);
      print(list);
    });
}

 data(Map<String, dynamic> item) {
    print("taking data");
    print(item);
    setState(() {
      list.add(item);
      list.toSet().toList();
    });
    print(list);
    _prefs.saveSearchedList(list);
    print("done");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Center(child: AppText.heading2(text: "Pick Location")),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                SliverToBoxAdapter(
                  child: AppText.heading6(
                    text:
                        "Find the area or city that you want to know the detailed weather info at this time",
                    centered: true,
                    multilines: true,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 25),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                          child: AppTextField(
                        controller: _controller,
                        onSubmitted: (value) {
                          value = _controller.text;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SearchResultView(query: value, getData: data)));
                        },
                      )),
                      const SizedBox(width: 15),
                      InkWell(
                        onTap: () => print(list),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kAccentColor.shade700),
                          child: const Icon(Icons.location_on),
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 25),
                ),
                list.isEmpty
                    ? const SliverToBoxAdapter(child: SizedBox())
                    :  SearchSlide(item: list),
                const SearchList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


