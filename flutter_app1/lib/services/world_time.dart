import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Worldtime{
  String location;// location name for the  ui
  String time; // time in that location
  String  flag; // flag of the region
  String url;// location url for api endpoint
  bool isDay;// true or false if its daytime
  Worldtime({this.location, this.flag, this.url});
  Future<void> getTime() async{
  try{

      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
    //      print(data);
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

    //      print(datetime);
      print(datetime);

      //Creating a object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // set the time property
      time = DateFormat.jm().format(now);
      isDay = (now.hour>6 && now.hour<20 )? true : false;//checking for day and night  time
//      print(isDay);
    }
    catch(e){
      print('caught Error: $e');
      time='could not get time data';
    }

 }


}

