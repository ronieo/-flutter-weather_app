import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:search_weather/data/my_location.dart';
import 'package:search_weather/data/fetchdata.dart';
import 'package:search_weather/screens/weather_screen.dart';

const apikey = 'c529a3358ccd19151a7d96cad657ecc5';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude3;
  late double longitude3;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    //자동으로 뜨진않고 버튼을 누르면 팝업이뜬다
    //LocationPermission permission = await Geolocator.requestPermission();
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    debugPrint(latitude3.toString());
    debugPrint(longitude3.toString());

    FetchData fetchData = FetchData(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

    var weatherData = await fetchData.getJsonData();
    debugPrint(weatherData.toString());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherScreen(
            parseWeatherData: weatherData,
          );
        },
      ),
    );
  }

// try {
// 실행에 실패할 수도 있는 코드
// } catch(exception) {
// 코드실행에 실패할 경우 출력될 내용 (예외 처리 구문)
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () => null,
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text('Get My Location'),
    )));
  }
}
