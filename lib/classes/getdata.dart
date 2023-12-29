import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class allCountries {
  late bool isDayTime;
  late String finalTime;
  late String timeZone;

  getData() async {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Algiers'));
    Map receivedData = jsonDecode(response.body);

    DateTime dateTime = DateTime.parse(receivedData["utc_datetime"]);
    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
    dateTime = dateTime.add(Duration(hours: offset));
    finalTime = DateFormat.jm().format(dateTime);
    timeZone = receivedData["timezone"];
    if (dateTime.hour > 5 && dateTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    print(finalTime);
    print(timeZone);
  }
}
