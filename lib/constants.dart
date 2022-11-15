import 'package:flutter/material.dart';

var dateTime = DateTime.now();
int whatHourNow = dateTime.hour.toInt();
int whatYearNow = dateTime.year.toInt();

bool isDay = whatHourNow < 18 && whatHourNow > 6 ? true : false;
String backgroundImage = isDay ? 'dayBackground.png' : 'nightBackground.png';

Color mainBlue = Color(0xFF90CAF9);
Color mainNightBlue = Color(0xFF2A344B);
Color mainBlack = Color(0xFF212121);
Color mainGray = Color(0xFF9E9E9E);
Color lightGray = Color(0xFFFAFAFA);
Color mainPowderblue = Color(0xFFBFDCE8);

Color mainColor = isDay ? mainBlue : mainNightBlue;

BoxDecoration customBoxDecoration(Color color) {
  return BoxDecoration(
      color: color, borderRadius: BorderRadius.all(Radius.circular(30)));
}
