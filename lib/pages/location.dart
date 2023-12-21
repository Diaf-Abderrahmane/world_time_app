// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                surfaceTintColor: Colors.white,
                elevation: 50,
                child: ListTile(
                  onTap: () {},
                  title: Text("data"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/algeria.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
