import 'dart:developer';

import 'package:firebasedatabase/pages/home_page.dart';
import 'package:firebasedatabase/rtdb_services.dart';
import 'package:firebasedatabase/user_model.dart';
import 'package:flutter/material.dart';

class RtdbPages extends StatefulWidget {
  static const String id = "rtdb_pages";
  const RtdbPages({super.key});

  @override
  State<RtdbPages> createState() => _RtdbPagesState();
}

class _RtdbPagesState extends State<RtdbPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Realtime Database"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                Player player = Player(
                  name: "Leonel Messi",
                  position: "hujumchi",
                  number: 10,
                  height: 1.65,
                  rating: 90,
                  country: "Argentina",
                  thropies: [
                    "golden boot",
                    "world cup",
                    "golden ball",
                    "the best sportsman",
                    "UCl",
                    "LA Liga"
                  ],
                  isMusilman: false,
                );
                RealDbServices services = RealDbServices();
                services.add(player);
              },
              child: Text("Add rtdb"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                RealDbServices services = RealDbServices();
                services.get().then((value) {
                  log("$value");
                });
              },
              child: Text("Get rtdb"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: MaterialButton(
              color: Colors.red,
              onPressed: () async {
                Player player = Player(
                  name: "Ronaldo",
                  position: "Hujumchi",
                  number: 7,
                  height: 1.85,
                  rating: 90,
                  country: "Portugliya",
                  thropies: ["UCl", "La Liga", "Portugal cup", "golden bool"],
                  isMusilman: false,
                );
                RealDbServices services = RealDbServices();
                services.update(player);
                log("${player.thropies}");
              },
              child: Text("update rtdb"),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: MaterialButton(
              color: Colors.blueAccent,
              onPressed: (){
                RealDbServices servises = RealDbServices();
                servises.delete();
              },
              child: Text("delete rtdb"),
            ),
          ),
        ],
      ),
    );
  }
}
