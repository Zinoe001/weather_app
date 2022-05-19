import 'package:flutter/material.dart';
import 'package:weather_app/views/home/home_view.dart';
import 'package:weather_app/views/search/search_view.dart';
import 'package:weather_app/views/setting/settings_view.dart';
import 'package:weather_app/widgets/bottom_nav_bar.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _HomeViewState();
}

int _selectedIndex = 0;
PageController _controller = PageController();

class _HomeViewState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    onPageChange(int index) {
      setState(() {
        _selectedIndex = index;
      });
      _controller.jumpToPage(index);
    }

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: onPageChange,
            controller: _controller,
            children: const [
              HomeView(),
              SearchView(),
              SettingsView(),
            ],
          ),
          Positioned(
              bottom: 10,
              left: 1,
              right: 1,
              child: BottomNavBar(index: _selectedIndex, onTap: onPageChange))
        ],
      ),
    );
  }
}
