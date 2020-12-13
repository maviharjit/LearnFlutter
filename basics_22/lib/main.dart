import 'package:flutter/material.dart';

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
  // this read the data using earquake API
  fetchPosts() async {}

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
                    itemBuilder: (BuildContext context, int index) {
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
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                        left:
                                            MediaQuery.of(context).size.width /
                                                19),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    )))),
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Banglore",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                Text("15 Km from Banglore",
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
        )

    ));
  }
}
