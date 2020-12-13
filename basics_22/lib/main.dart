import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:basics_22/modules/global.dart';
import 'package:basics_22/modules/weatherApi.dart';
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Weather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // what is happening here?
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherApi weatherApi;

  // this read the data using earquake API
  fetchPosts() async {
    var response = await http
        .get(EARTHQUAKE_URL, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      print(response.body);
      // take the response body and decode the json. is it deserializing?
      final data = json.decode(response.body);
      // what does fromJson do?
      weatherApi = WeatherApi.fromJson(data);
      return weatherApi;
    } else {
      //print("error");
      return "Sorry for Inconvenience,Server Under Maintenance";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(widget.title),
        ),
        body: Container(
            // why does the list contain so many boxes when i expected only one
            // what is FutureBuilder
            child: FutureBuilder(
          future: fetchPosts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // show hourglass if there is no data, like if app just started
            if (snapshot.data == null) {
              return Container(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            } else if (snapshot.data != null) {
              if (snapshot.data ==
                  "Sorry for Inconvenience,Server Under Maintenance") {
                return Container(
                  child: Center(
                    child: Text(snapshot.data),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: weatherApi.features.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<String> places = weatherApi
                          .features[index].properties.place
                          .split(",");
                      print(places);
                      return Container(
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color(0xFFE0E0E0),
                                offset: Offset(0.5, 0.5),
                                blurRadius: 10.0,
                              ),
                            ],
                            shape: BoxShape.rectangle,
                            color: Color(0xFFFAFAFA),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                19),
                                        child: Text(
                                          (weatherApi.features[index].properties
                                                  .mag)
                                              .ceil()
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )))),
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(places[places.length-1].trim(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                    Text(places[0],
                                        style: TextStyle(fontSize: 12))
                                  ]),
                            )
                          ],
                        ),
                      );
                    });
              }
            }
          },
        )));
  }
}
