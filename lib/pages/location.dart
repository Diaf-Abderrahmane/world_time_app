// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/classes/getdata.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<AllCountries> allCountries = [
    AllCountries(
        flag: "algeria.png",
        countryName: "Algeria - Algiers",
        url: 'http://worldtimeapi.org/api/timezone/Africa/Algiers'),
    AllCountries(
        flag: "egypt.png",
        countryName: "Egypt - Cairo",
        url: 'http://worldtimeapi.org/api/timezone/Africa/Cairo'),
    AllCountries(
        flag: "tunisia.png",
        countryName: "Tunisia - Tunis",
        url: 'http://worldtimeapi.org/api/timezone/Africa/Tunis'),
    AllCountries(
        flag: "canada.png",
        countryName: "Canada - Ottawa",
        url: 'http://worldtimeapi.org/api/timezone/America/Toronto'),
    AllCountries(
        flag: "australia.png",
        countryName: "Australia - Sydney",
        url: 'http://worldtimeapi.org/api/timezone/Australia/Sydney'),
    //AllCountries(flag: "morocco.png", countryName: "Morocco - Rabat"),
    //AllCountries(flag: "canada.png", countryName: "Canada - Otawa"),
  ];

  getDataLoca(String flag, String countryName, String url) async {
    AllCountries oneCountry =
        AllCountries(flag: flag, countryName: countryName, url: url);
    await oneCountry.getData();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": oneCountry.finalTime,
      "location": oneCountry.timeZone,
      "isDay": oneCountry.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 244, 185),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 107, 170, 154),
        title: Text("Choose location", style: TextStyle(fontSize: 22)),
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: allCountries.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                surfaceTintColor: Colors.white,
                elevation: 50,
                child: ListTile(
                  onTap: () {
                    getDataLoca(
                        allCountries[index].flag,
                        allCountries[index].countryName,
                        allCountries[index].url);
                  },
                  title: Text(allCountries[index].countryName),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/${allCountries[index].flag}"),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
