// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:world_time_app/classes/getdata.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoadingPage() async {
    AllCountries oneCountry = AllCountries(
        flag: "algeria.png",
        countryName: "Algeria - Algiers",
        url: 'http://worldtimeapi.org/api/timezone/Africa/Algiers');
    await oneCountry.getData();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": oneCountry.finalTime,
      "location": oneCountry.timeZone,
      "isDay": oneCountry.isDayTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLoadingPage();
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
