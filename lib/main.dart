import 'package:flutter/material.dart';
import 'package:weather1/popular_city_widget.dart';
import 'package:weather1/question_widget.dart';
import 'package:weather1/search_field_widget.dart';
import 'package:weather1/weather_api.dart';
import 'package:weather1/weather_widget.dart';
import 'package:weather1/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WeatherData? weather;
  ScrollController scrollController = ScrollController();
  void _scrollToTop() {
    setState(() {
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 400), //duration of scroll
          curve: Curves.fastOutSlowIn //scroll type
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/$backgroundImage'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SearchField((WeatherData weatherData) {
                      if (weatherData != weather) {
                        setState(() {
                          weather = weatherData;
                        });
                      }
                    }),
                    WeatherWidget(weather),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 70, 16, 35),
                child: Text(
                  'Check the weather in most popular cities in the world',
                  style: TextStyle(
                    fontSize: 28,
                    color: mainBlack,
                  ),
                ),
              ),
              PopularCityCard(_scrollToTop, (WeatherData weatherData) {
                if (weatherData != weather) {
                  setState(() {
                    weather = weatherData;
                  });
                }
              }),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 90, 16, 15),
                child: Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    fontSize: 28,
                    color: mainBlack,
                  ),
                ),
              ),
              const Questions(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Container(
                  height: 100,
                  decoration: customBoxDecoration(lightGray),
                  child: Center(
                    child: Text(
                      'Oleksandr Bihnyak - $whatYearNow',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
