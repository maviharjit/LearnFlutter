/*{
  "shape_name":"rectangle",
  "property":{
    "width":5.0,
    "breadth":10.0
  }
}*/

import 'dart:ffi';

// lets create the inner class first
class Property {
  Double width;
  Double breadth;

  Property({this.width, this.breadth});

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(breadth: json["breadth"], width: json["width"]);
  }
}

// outer class
class Shape {
  String shapename;
  Property property;

  Shape({this.shapename, this.property});

  factory Shape.fromJson(Map<String, dynamic> json) {
    return Shape(
      shapename: json["shape_name"],
      property: Property.fromJson(json["property"]),
    );
  }
}
