import 'package:flutter/material.dart';
import 'package:flutter_app1/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='Loading';
  void setupWorldtime() async{
    Worldtime instance = Worldtime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location':instance.location,
        'flag': instance.flag,
      'time':instance.time,
      'isDay':instance.isDay,
    });

  }
  @override
  void initState() {
    super.initState();
      setupWorldtime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 50.0,
          ),

      ),
    );
  }
}
