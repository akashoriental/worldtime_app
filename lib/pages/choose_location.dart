import 'package:flutter/material.dart';
import 'package:worldtime_app/pages/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  TextEditingController _controller = TextEditingController();
  String ?entercity;
  void updateTime(String city) async {
    try {
      WorldTime instance = WorldTime.instance;
      await instance.getTime(city);
      Navigator.pop(context);
    }
    catch(e){
      print(e);
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text('Please enter a valid input'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
            _controller.clear();
          }, child: Text('ok'))
        ],
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
          filled: true,
          fillColor: Colors.amberAccent,
          hintText: 'Enter City Name',
          icon: Icon(Icons.home),
        ),
          onChanged: (val){
          setState(() {
            entercity=val;
          });
          },
          onSubmitted: (val){
          updateTime(val);
          },
        ),
      ),
      // ListView.builder(
      //     itemCount: locations.length,
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      //         child: Card(
      //           child: ListTile(
      //             onTap: () {
      //               updateTime(index);
      //             },
      //             title: Text(locations[index].location),
      //             leading: CircleAvatar(
      //               backgroundImage: AssetImage('assets/${locations[index].flag}'),
      //             ),
      //           ),
      //         ),
      //       );
      //     }
      // ),
    );
  }
}
