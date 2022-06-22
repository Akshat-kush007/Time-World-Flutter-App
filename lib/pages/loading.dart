import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'dart:convert';
import 'package:time_world/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setTime() async{
    WorldTime instace = WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png');
    await instace.getTime();
    
    setState(() {
     Navigator.pushReplacementNamed(context, "/home",arguments: {
      'time':instace.time,
      'flag':instace.flag,
      'location':instace.location,
      'isDay':instace.isDay,
     });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTime();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
          child :SpinKitThreeBounce(
                  color: Colors.blue,
                  size: 20.0,
                  duration: Duration(microseconds: 1000000),
                ),
        ),
    );
  }
}