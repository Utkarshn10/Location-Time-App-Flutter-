

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data:ModalRoute.of(context).settings.arguments;
    print(data);
    //set Background
    String  bgImage = data['isDay']?'day.png':'night.png';
    Color bgColor = data['isDay']?Colors.blue:Colors.indigo[700];
    Color textColor = data['isDay']?Colors.blue:Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/'+bgImage),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: SafeArea(
              child: Column(
                children: [
                  FlatButton.icon(
                    onPressed: () async{
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data={
                         'time': result['time'],
                         'location': result['location'],
                         'isDay': result['isDay'],
                         'flag': result['flag'],
                       };
                     });
                   },
                    icon: Icon(Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text('Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                    ),
                   ),
                  SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                            color: Colors.white,
                          letterSpacing: 2.0
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}