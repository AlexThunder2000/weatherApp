import 'package:flutter/material.dart';

var dateTime = DateTime.now();
int whatHourNow = dateTime.hour.toInt();
int whatYearNow = dateTime.year.toInt();

bool isDay = whatHourNow < 18 && whatHourNow > 6 ? true : false;
String backgroundImage = isDay ? 'dayBackground.png' : 'nightBackground.png';

Color mainBlue = const Color(0xFF90CAF9);
Color mainNightBlue = const Color(0xFF2A344B);
Color mainBlack = const Color(0xFF212121);
Color mainGray = const Color(0xFF9E9E9E);
Color lightGray = const Color(0xFFFAFAFA);
Color mainPowderBlue = const Color(0xFFBFDCE8);

Color mainColor = isDay ? mainBlue : mainNightBlue;

BoxDecoration customBoxDecoration(Color color) {
  return BoxDecoration(
      color: color, borderRadius: const BorderRadius.all(Radius.circular(30)));
}
