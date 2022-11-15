import 'package:flutter/material.dart';
import 'package:weather1/weather_api.dart';
import 'package:weather1/constants.dart';

class SearchField extends StatefulWidget {
  const SearchField(this.setCityName, {Key? key}) : super(key: key);
  final Function(WeatherData) setCityName;
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: customBoxDecoration(Colors.white),
      margin: EdgeInsets.fromLTRB(16, 135, 16, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 18, 20, 0),
            height: 24,
            width: 250,
            child: TextField(
              onSubmitted: (text) async {
                WeatherData weather = await WeatherDataFromAPI().getData(text);

                widget.setCityName(weather);
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: 'Start typing for search...',
                hintStyle: TextStyle(color: mainGray, fontSize: 16),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.all(10),
            decoration: customBoxDecoration(mainColor),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
