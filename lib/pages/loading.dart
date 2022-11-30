import 'package:flutter/material.dart';
import 'package:worldtime_app/pages/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='loading';
  void setWorldtime() async{
    WorldTime instance = WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }
  @override
  void initState() {
    super.initState();
    setWorldtime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Center(
          child: SpinKitHourGlass(
            color: Colors.white,
            size: 50.0,
          )
      )
    );
  }
}

