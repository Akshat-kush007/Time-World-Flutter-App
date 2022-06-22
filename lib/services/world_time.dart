
import 'package:http/http.dart';
import 'dart:convert';
import "package:intl/intl.dart";


class WorldTime{

  WorldTime({required this.location,required this.flag,required this.url});

  late String location;
  late String flag;
  late String url;
  late String time;
  late bool isDay;

  Future<void> getTime() async{

    try{

    Response res =  await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map map = jsonDecode(res.body);
    
    String datetime = map['datetime'];
    String offset= map['utc_offset'];
    
    
    String hrs=offset.substring(1,3);
    String min=offset.substring(4,6);

    DateTime date=DateTime.parse(datetime);
    print(date);
    date=date.add(Duration(hours: int.parse(hrs)));
    date=date.add(Duration(minutes: int.parse(min)));

    time=DateFormat.jm().format(date);
    isDay= date.hour>6 && date.hour<20 ? true : false;
    
    print("Date : ${date.day}/${date.month}/${date.year}");
    print("Time : ${(date.hour)%12}:${date.minute}:${date.second}");
    print("isDay : $isDay");
    }
    catch(e){
      print("Error : $e");
      time="Incorrect url";
    }

  }
}
