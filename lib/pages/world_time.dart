import 'package:http/http.dart';
import 'dart:convert';
const ApiKey='d3bcd68d7a3db13eb7cbb13e837561cb';
class WorldTime {
  String ?location;
  double ?mausam;
  int ?temp;
  String ?country;
  bool? isDaytime;
  String ?time;
  WorldTime({required this.location});
  Future<void> getTime() async {
    // make the request
    Response resp=await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$ApiKey&units=metric'));
    Map data = jsonDecode(resp.body);
    //print(data);

    // get properties from json
     location = data['name'];
     mausam = data['main']['temp'];
     temp=mausam!.toInt();
     country = data['sys']['country'];
     final utc_time = DateTime.now().toUtc();
     final dayyime = DateTime.now().toUtc().add(Duration(seconds: data['timezone']));
     print(dayyime);
     int hour=dayyime.hour;
     int min=dayyime.minute;
     time = min<10?'$hour : 0$min':'$hour : $min';
    isDaytime = hour > 6 && hour < 20 ? true : false;
     //final minutes = (data['timezone']/3600).toString().split('.')[1];
    print(location);
    print(temp!.toInt());
    print(country);
    print(time);

    // create DateTime object
    // DateTime now = DateTime.parse(datetime);
    // now = now.add(Duration(hours: int.parse(offset)));
    // time=DateFormat.jm().format(now);
  }
}