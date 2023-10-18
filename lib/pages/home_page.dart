import 'dart:developer';
import 'package:firebasedatabase/user_model.dart';
import 'package:flutter/material.dart';
import '../firebase_db_services.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async{
                Player futballPlayer = Player(
                    name: "Eldor Shomurodov",
                    position: "Hujumchi",
                    number: 14,
                    height: 1.9,
                    rating: 72,
                    country: "Uzbekistan",
                    thropies: ["Asian cup", "Ozbekiston PFL kubugi", "2019, 2021 O'zb ning eng yaxshi futbolchisi"],
                    isMusilman: true,
                );

                 DatabaseServices databaseServices = DatabaseServices();
                 databaseServices.add(futballPlayer);
              },
              child: Text("Add player"),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(
              onPressed: () async{
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value) {
                  for(final item in value){
                    log(item.thropies.toString());
                  }
                });
              },
              child: Text("Get player"),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(
              onPressed: () async{
                Player futballPlayer = Player(
                  name: "Muhammad Salah",
                  position: "Hujumchi",
                  number: 10,
                  height: 1.75,
                  rating: 89,
                  country: "Misr",
                  thropies: ["Champions league", "APL"],
                  isMusilman: true,
                );
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value){
                  for(final item in value){
                    if(item.name == "Eldor Shomurodov"){
                      futballPlayer.id = item.id;
                      databaseServices.updates(futballPlayer);
                    }
                  }
                });
              },
              child: Text("Update player"),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(
              onPressed: () async{
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value){
                  for(final item in value){
                    if(item.name == "Muhammad Salah"){
                      databaseServices.delete(item.id ?? "");
                    }
                  }
                });
              },
              child: Text("Delete player"),
            ),
          ),
        ],
      ),
    );
  }
}
