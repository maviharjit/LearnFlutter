import 'package:dart/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget.dart';
import 'package:tic_tac_toe_app/components/board.dart';
import 'package:tic_tac_toe_app/components/o.dart';
import 'package:tic_tac_toe_app/components/x.dart';
import 'package:tic_tac_toe_app/services/board.dart';
import 'package:tic_tac_toe_app/services/provider.dart';
import 'package:tic_tac_toe_app/theme/theme.dart';

class GamePage extends Stateful Widget {
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  final boardService = locator<BoardService>();
  @override
  Widget build(BuildContext context) {
    return willPopScope
        onWillPop: () {
          boardService.newGame();
          return Future.value(true);
      },
      child: SafeArea (
        child: Scaffold (
          backgroundColor: Colors.white,
          body: SafeArea (
            child: StreamBuilder<MapEntry<int, int>>(
              stream: boardService.score$,
              builder: (context, AsyncSnapshot<MapEntry<int, int>> snapshot) {
                if(!snapshot.hasData) {
                  return Container();
                }
                final int xScore = snapshot.data.key;
                final int oScore = snapshot.data.value;

                return Container(
                  width: MediaQuery.of(context).size.width;
                  child: Column (
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expand(
                        child: Column (
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.white,
                              child: Row (
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Material (
                                      elevation: 5,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Center(
                                        child: Text(
                                          "$xScore",
                                          style: TextStyle (
                                            color: Colors.black,
                                            fontSize: 18), // TextStyle
                                          ),), // Text, Center
                                      ), // Material
                                    ), // SizedBox
                                    Expanded(
                                      child: Container(),
                                    ), // Expanded
                                    X(35, 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10), // EdgeInsets.symmetric
                                      child: Text(
                                        "Player",
                                        style: TextStyle(fontSize: 20),
                                      ), // Text
                                    ), // Padding
                                  ], // <Widget>[]
                                ), // Row
                              ), // Container
                              Container(
                                child: Column (
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[Board()],
                                ),), // Column, Container
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                color: Color.white,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center
                                  children: <Widget>[
                                    O(35, MyTheme.orange),
                                    Padding (
                                      padding: EdgeInsets.symmetric (
                                        horizontal: 10,
                                      ), // EdgeInsets.symmetric
                                      child: Text (
                                        "Player",
                                        style: TextStyle(fontSize: 20),
                                      ), // Text
                                    ), // Padding
                                    Expanded(
                                      child: Container(),
                                    ), // Expanded
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Material (
                                        elevation: 5,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Center(
                                          child: Text (
                                            "$oScore",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18), // TextStyle
                                            ),), // Text, Center
                                        ), // Material
                                      ), // SizedBox
                                  ] // <Widget> []
                                ), // Row
                              ), // Container
                          ], // <Widget> []
                        ), // Column
                      ), // Expand
                      Container(
                        color: Colors.white,
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row (
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget> [
                            Expanded(
                              child: Container(),
                            ), // Expanded
                            IconButton (
                              icon: Icon(Icons.home),
                              onPressed: () {
                                boardService.newGame();
                                Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                              },
                              color: Colors.black87,
                              iconSize: 30,
                            ), // IconButton
                          ], // <Widget> []
                        ), // Row
                      ), // Container
                    ], // <Widget> []
                  ), // Column
                ), // Container
              }), // StreamBuilder
        ), // SafeArea
      ), // Scaffold
    ), // SafeArea
  } // build
} // GamePageState