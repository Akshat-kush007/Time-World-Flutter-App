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
  
    data = data.isNotEmpty? data : (ModalRoute.of(context)!.settings.arguments) as Map;
    String bgImage= data['isDay'] ?'day.png': 'night.png';
    Color textColor = data['isDay'] ?Colors.black: Colors.white;
    
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/$bgImage"),
            fit: BoxFit.cover)
          ),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic newData=await Navigator.pushNamed(context, "/location");
                        data=newData as Map;
                        setState(() {                         
                          
                        });
                      },
                      icon: Icon(Icons.edit_location,color:textColor,),
                      label: Text("Change Location",style: TextStyle(color:textColor,),)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                  backgroundImage: AssetImage("images/${data["flag"]}"),
                ),
                SizedBox(width: 20,),
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                          color:textColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(data['time'],style:TextStyle(fontSize: 40,letterSpacing: 4,color:textColor,))
                ],
              )),
        ));
  }
}
