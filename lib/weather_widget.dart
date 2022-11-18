import 'package:flutter/material.dart';
import 'package:weather1/weather_api.dart';
import 'package:weather1/constants.dart';

class WeatherWidget extends StatefulWidget {
  WeatherWidget(this.weather, {Key? key}) : super(key: key);

  WeatherData? weather;

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  var dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    if (widget.weather == null) {
      return const SizedBox.shrink();
    } else {
      return Container(
        margin: const EdgeInsets.fromLTRB(16, 50, 16, 135),
        decoration: customBoxDecoration(const Color(0xD9FFFFFF)),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: customBoxDecoration(Colors.white),
                    margin: const EdgeInsets.all(20),
                    child: Image(
                      height: 100,
                      width: 100,
                      image: NetworkImage(
                          'http://openweathermap.org/img/w/${widget.weather?.icon}.png'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.weather?.temperature > 0
                                ? '+${widget.weather?.temperature.toInt()}°C'
                                : '${widget.weather?.temperature.toInt()}°C',
                            style: TextStyle(
                              fontSize: 18,
                              color: mainBlack,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.weather?.weatherMain,
                            style: TextStyle(
                              fontSize: 16,
                              color: mainBlack,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.weather?.weatherDescription,
                            style: TextStyle(
                              fontSize: 16,
                              color: mainGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${widget.weather?.cityName}, ${widget.weather?.countryName} ',
                    style: TextStyle(
                      fontSize: 18,
                      color: mainBlack,
                    ),
                  ),
                  Text(
                    '${dateTime.day}.${dateTime.month}.${dateTime.year}',
                    style: TextStyle(
                      fontSize: 16,
                      color: mainGray,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  color: mainPowderBlue,
                ),
              ),
              IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'MIN',
                            style: TextStyle(
                              fontSize: 16,
                              color: mainGray,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.weather?.temperatureMin > 0
                                ? '+${widget.weather?.temperatureMin.toInt()}°C'
                                : '${widget.weather?.temperatureMin.toInt()}°C',
                            style: TextStyle(
                              fontSize: 18,
                              color: mainBlack,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: mainPowderBlue,
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          Text(
                            'MAX',
                            style: TextStyle(
                              fontSize: 16,
                              color: mainGray,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.weather?.temperatureMax > 0
                                ? '+${widget.weather?.temperatureMax.toInt()}°C'
                                : '${widget.weather?.temperatureMax.toInt()}°C',
                            style: TextStyle(
                              fontSize: 18,
                              color: mainBlack,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
