import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtime_app/modal.dart';
const ApiKey='d3bcd68d7a3db13eb7cbb13e837561cb';

class WorldTime {
  WorldTime._privateConstructor();

  static final WorldTime _instance = WorldTime._privateConstructor();

  static WorldTime get instance => _instance;
  Welcome ?weather;
  Future<void> getTime(String? location) async {
    // make the request
    weather=await fetchAlbum(location);
    //Response resp=await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$ApiKey&units=metric'));
    //Map data = jsonDecode(resp.body);
    //print(data);

    // get properties from json
    //  location = weather.name;
    //  temp=mausam!.toInt();
    //  country = data['sys']['country'];
    //  final utc_time = DateTime.now().toUtc();
    //  final dayyime = DateTime.now().toUtc().add(Duration(seconds: data['timezone']));
    //  print(dayyime);
    //  int hour=dayyime.hour;
    //  int min=dayyime.minute;
    //  time = min<10?'$hour : 0$min':'$hour : $min';
    // isDaytime = hour > 6 && hour < 20 ? true : false;
    //  //final minutes = (data['timezone']/3600).toString().split('.')[1];
    // print(location);
    // print(temp!.toInt());
    // print(country);
    // print(time);

    // create DateTime object
    // DateTime now = DateTime.parse(datetime);
    // now = now.add(Duration(hours: int.parse(offset)));
    // time=DateFormat.jm().format(now);
  }
  Welcome ?getWeather(){
    return weather;
  }
}