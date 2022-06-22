import 'package:flutter/material.dart';
import 'package:time_world/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void setTime(int index) async{
    WorldTime instace =locations[index];
    await instace.getTime();
    
    setState(() {
     Navigator.pop(context, {
      'time':instace.time,
      'flag':instace.flag,
      'location':instace.location,
      'isDay':instace.isDay,
     });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 6),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/${locations[index].flag}"),
                ),
                title: Text(locations[index].location),
                onTap: () {
                  setTime(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
