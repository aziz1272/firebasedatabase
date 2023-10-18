class Player {
  String name;
  String position;
  int number;
  double height;
  double rating;
  String country;
  List<String> thropies;
  bool isMusilman;
  String? id;

   Player({
     required this.name,
     required this.position,
     required this.number,
     required this.height,
     required this.rating,
     required this.country,
     required this.thropies,
     required this.isMusilman,
     this.id,
   });

   factory Player.fromJson(Map<String, dynamic> json){

     List<String> list = [];
      for(var item in json["thropies"]){
        list.add("$item");
      }
     return  Player(
       name : json["name"],
     position : json["position"],
     number : json["number"],
     height : json["height"],
     rating : json["rating"],
     country : json["country"],
     thropies : list,
     isMusilman : json["isMusilman"],
     );
   }

   Map<String, dynamic> toJson () => {
     "name" : name,
     "position" : position,
     "number" : number,
     "height" : height,
     "rating" : rating,
     "country" : country,
     "thropies" : thropies,
     "isMusilman":isMusilman,
   };
}