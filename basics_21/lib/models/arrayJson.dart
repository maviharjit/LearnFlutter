/*{
  "class":"XII",
  "subjects":["Physics","Chemistry","Maths"]
}*/

class Student {
  String standard;
  List<String> subjects;

  Student({this.standard, this.subjects});

  // what does factory do?
  // is this deserialization i.e. converting raw data/string to object
  // yes it is
  factory Student.fromJson(Map<String, dynamic> json) {
    var subjectsFromJson = json["subjects"];
    List<String> subjectsList = new List<String>.from(subjectsFromJson);

    return Student(
      standard: json["class"],
      subjects: subjectsList,
    );
  }
}
