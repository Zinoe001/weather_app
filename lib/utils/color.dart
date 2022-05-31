import 'package:flutter/material.dart';
// defined the primaryColor of the app
Map<int, Color> _primaryColor = {
  50 : const Color(0XFF0000FF).withOpacity(0.1),
  100 : const Color(0XFF0000FF).withOpacity(0.2),
  200 : const Color(0XFF0000FF).withOpacity(0.3),
  300 : const Color(0XFF0000FF).withOpacity(0.4),
  400 : const Color(0XFF0000FF).withOpacity(0.5),
  500 : const Color(0XFF0000FF).withOpacity(0.6),
  600 : const Color(0XFF0000FF).withOpacity(0.7),
  700 : const Color(0XFF0000FF).withOpacity(0.8),
  800 : const Color(0XFF0000FF).withOpacity(0.9),
  900 : const Color(0XFF0000FF),
};

final MaterialColor kPrimaryColor = MaterialColor(0XFF0000FF, _primaryColor);

Map<int, Color> _secondaryColor = {
  50 : const Color(0XFF000033).withOpacity(0.1),
  100 : const Color(0XFF000033).withOpacity(0.2),
  200 : const Color(0XFF000033).withOpacity(0.3),
  300 : const Color(0XFF000033).withOpacity(0.4),
  400 : const Color(0XFF000033).withOpacity(0.5),
  500 : const Color(0XFF000033).withOpacity(0.6),
  600 : const Color(0XFF000033).withOpacity(0.7),
  700 : const Color(0XFF000033).withOpacity(0.8),
  800 : const Color(0XFF000033).withOpacity(0.9),
  900 : const Color(0XFF000033),
};

final MaterialColor kSecondaryColor = MaterialColor(0XFF000033, _secondaryColor);

Map<int, Color> _accentColor = {
  50 : const Color(0XFF666666).withOpacity(0.1),
  100 : const Color(0XFF666666).withOpacity(0.2),
  200 : const Color(0XFF666666).withOpacity(0.3),
  300 : const Color(0XFF666666).withOpacity(0.4),
  400 : const Color(0XFF666666).withOpacity(0.5),
  500 : const Color(0XFF666666).withOpacity(0.6),
  600 : const Color(0XFF666666).withOpacity(0.7),
  700 : const Color(0XFF666666).withOpacity(0.8),
  800 : const Color(0XFF666666).withOpacity(0.9),
  900 : const Color(0XFF666666),
};

final MaterialColor kAccentColor = MaterialColor(0XFF666666, _accentColor);

Color kSkelenton = Colors.black.withOpacity(0.4);