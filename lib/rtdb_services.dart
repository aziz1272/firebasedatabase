import 'package:firebase_database/firebase_database.dart';
import 'package:firebasedatabase/user_model.dart';

class RealDbServices {
  FirebaseDatabase database = FirebaseDatabase.instance;

  ///Add
  Future<void> add(Player player) async {
    DatabaseReference ref = database.ref('players/571');
    await ref.set(player.toJson());
  }

  ///Get
  Future get() async {
    DatabaseReference ref = database.ref('players');
    final data = await ref.child('571').get();
    return data.value;
  }

  ///Update
  Future<void> update(Player player)async{
    DatabaseReference ref = database.ref('players/571');
    await ref.update(player.toJson());
  }


  ///Delete
  Future<void> delete() async {
    DatabaseReference ref = database.ref('players');
    final data = await ref.child('571').remove();
    return data;
  }

}