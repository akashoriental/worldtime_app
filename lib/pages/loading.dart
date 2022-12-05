import 'package:flutter/material.dart';
import 'package:worldtime_app/get_location.dart';
import 'package:worldtime_app/pages/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setWorldtime() async{
    Location location = Location();
    await location.getCurrentLocation();
    WorldTime instance = WorldTime(location: location.city);
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'temp': instance.temp,
      'country': instance.country,
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
      backgroundColor: Colors.cyan,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SpinKitHourGlass(
                color: Colors.white,
                size: 80.0,
              )
          ),
          SizedBox(height: 50,),
          Text('Please Wait! While we Loading Your Current Location',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
        ],
      )
    );
  }
}

