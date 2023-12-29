// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map receivedDataFromLoadingScreen =
        ModalRoute.of(context)!.settings.arguments as Map;

    String bgImg =
        receivedDataFromLoadingScreen["isDay"] ? "day.png" : "night.png";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/$bgImg"), fit: BoxFit.cover),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                },
                icon: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 132, 72, 211)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))))),
            SizedBox(
              height: 150,
            ),
            Container(
              width: double.infinity,
              color: Color.fromARGB(99, 101, 224, 153),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 33),
              child: Column(
                children: [
                  Text(
                    receivedDataFromLoadingScreen["time"],
                    style: TextStyle(fontSize: 50, color: Colors.black),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    receivedDataFromLoadingScreen["location"],
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
