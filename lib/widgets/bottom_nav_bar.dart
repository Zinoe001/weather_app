import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.index, required this.onTap})
      : super(key: key);

  final int index;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kSecondaryColor.shade300,
      ),
      child: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kAccentColor,
        currentIndex: index,
        onTap: onTap,
        items: const <BottomNavigationBarItem>[     
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                size: 35,
              ),
              label: "Search"),
              BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 35,
              ),
              label: "Settings"),    
        ],
      ),
    );
  }
}
