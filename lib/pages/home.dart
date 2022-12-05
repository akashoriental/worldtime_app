import 'dart:ui';

import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isDaytime'] ? 'sunny.jpeg' : 'night.jpeg';
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
                  if(result != null){
                    setState(() {
                      data = {
                        'location': result['location'],
                        'temp': result['temp'],
                        'country': result['country'],
                        'isDaytime': result['isDaytime'],
                      };
                    });
                  }
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
            Text('Your Current Location is  '+data['location'].toString(),style: TextStyle(backgroundColor: Colors.deepOrange,fontWeight: FontWeight.w700,color: Colors.white,fontStyle: FontStyle.italic,fontSize: 30),),

            Text('Current temp is  '+data['temp'].toString()+'°C',style: TextStyle(backgroundColor: Colors.deepOrange,fontWeight: FontWeight.w700,color: Colors.white,fontStyle: FontStyle.italic,fontSize: 30),),

            Text('Your Current country code is  '+data['country'].toString(),style: TextStyle(backgroundColor: Colors.deepOrange,fontWeight: FontWeight.w700,color: Colors.white,fontStyle: FontStyle.italic,fontSize: 30),),
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
