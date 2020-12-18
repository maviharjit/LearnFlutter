/*{
  "id":"123",
  "name":"John Snow"
  "score": 98
}*/

class Student {
  String id;
  String name;
  int score;

  Student({this.id, this.name, this.score});

  // what does factory do?
  // is this deserialization i.e. converting raw data/string to object
  // yes it is deserialization. we are creating an object from JSON string
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id:json["id"],
      name:json["name"],
      score:json["score"]
    );
  }
}
