// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getData() async {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Algiers'));
    Map receivedData = jsonDecode(response.body);

    late bool isDayTime;
    DateTime dateTime = DateTime.parse(receivedData["utc_datetime"]);
    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
    dateTime = dateTime.add(Duration(hours: offset));
    String finalTime = DateFormat.jm().format(dateTime);
    String timeZone = receivedData["timezone"];
    if (dateTime.hour > 5 && dateTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    print(finalTime);
    print(timeZone);

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": finalTime,
      "location": timeZone,
      "isDay": isDayTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SpinKitFoldingCube(
            color: Colors.amber,
            size: 100,
          ),
        ]),
      ),
    );
  }
}
