import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedatabase/user_model.dart';

class DatabaseServices{
  String collectionName = "players";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Add
Future<void> add(Player player) async{
  final collection = firestore.collection(collectionName);
  await collection.add(player.toJson());
}

 //Get
Future<List<Player>> get() async {
  List<Player> players = [];
  final collection = firestore.collection(collectionName);
  final result = await collection.get();
  for(final item in result.docs){
    try{
      Player player = Player.fromJson(item.data());
      player.id = item.id;
      players.add(player);
    }
    catch(error){
      log("$error");
    }
  }
  return players;
}

// updates
Future<void> updates(Player player) async {
  final collection = firestore.collection(collectionName);
  collection.doc(player.id).update(player.toJson());
}

//delete
Future<void> delete (String id) async {
  final collection = firestore.collection(collectionName);
  collection.doc(id).delete();
}
}