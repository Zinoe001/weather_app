import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/functions.dart';
import 'package:weather_app/views/home/home_view.dart';
import 'package:weather_app/views/search/search_view.dart';
import 'package:weather_app/views/setting/settings_view.dart';

class Body extends StatelessWidget {
  Body({
    Key? key, 
  }) : super(key: key);
  
  List<Widget> _buildScreens() {
    return [
      SearchView(),
      const HomeView(),
      const SettingsView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.search_outlined,
          size: 35,
        ),
        // title: ("Search"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kAccentColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          color: kSecondaryColor,
          size: 35,
        ),
        // title: ("Home"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kAccentColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.settings,
          size: 35,
        ),
        // title: ("Settings"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kAccentColor,
      ),
    ];
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);
  static final WeatherFunction functions = WeatherFunction();
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
