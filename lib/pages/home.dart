import 'dart:ui';
import 'package:worldtime_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:worldtime_app/modal.dart';
import 'package:worldtime_app/pages/world_time.dart';
DateTime getTime(int timezone) {
  return DateTime.now().toUtc().add(
      Duration(seconds: timezone));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Welcome? data;
  WorldTime worldTime=WorldTime.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=worldTime.getWeather();
  }
  @override
  Widget build(BuildContext context) {
    String bgImage = 'sunny.jpeg';
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Container(
          width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/$bgImage'),
          fit: BoxFit.fill,
    )
    ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
                onPressed: () async{
                  dynamic result=await Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text(
                    'Edit Location',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                )
            ),
            Container(
              color: Colors.black,
              child: Text(getTime(data!.timezone!).toString(),style: KTextStyle),
            ),
            Container(
                color: Colors.black,
                child: Text('Your Current Location is  ${data!.name}',style: KTextStyle)),

            Container(
              color: Colors.black,
                child: Text('Current temp is  ${data!.main!.temp}°C',style: KTextStyle)),

            Text('Your Current country code is  ${data!.sys!.country}',style: TextStyle(backgroundColor: Colors.deepOrange,fontWeight: FontWeight.w700,color: Colors.white,fontStyle: FontStyle.italic,fontSize: 30),),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/');
            },
                child: Text('Get Current Location'),style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.amber)),)
          ],
        ),
      ),
      ),
    );
  }
}
