import 'package:flutter/material.dart';
import 'package:weather1/popular_city_list.dart';
import 'package:weather1/weather_api.dart';
import 'package:weather1/constants.dart';
import 'package:weather1/main.dart';

class PopularCityCard extends StatefulWidget {
  const PopularCityCard(this.scrollToTop, this.setCityName, {Key? key})
      : super(key: key);
  final VoidCallback scrollToTop;
  final Function(WeatherData) setCityName;

  @override
  State<PopularCityCard> createState() => _PopularCityCardState();
}

class _PopularCityCardState extends State<PopularCityCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: cities.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            image: DecorationImage(
              image: AssetImage(
                  'assets/popular_city/${cities[index].popularCity}.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 170, 10, 14),
            decoration: customBoxDecoration(Colors.white),
            child: TextButton(
              onPressed: () async {
                WeatherData weather = await WeatherDataFromAPI()
                    .getData(cities[index].popularCity);

                widget.setCityName(weather);
                widget.scrollToTop();
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 4),
                  child: Text(
                    cities[index].popularCity,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
