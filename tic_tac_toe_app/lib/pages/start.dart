import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/components/button.dart';
import 'package:tic_tac_toe_app/components/logo.dart';
import 'package:tic_tac_toe_app/pages/game.dart';
import 'package:tic_tac_toe_app/pages/pick.dart';
import 'package:tic_tac_toe_app/pages/settings.dart';
import 'package:tic_tac_toe_app/services/alert.dart';
import 'package:tic_tac_toe_app/services/board.dart';
import 'package:tic_tac_toe_app/services/provider.dart';
import 'package:tic_tac_toe_app/services/sound.dart';
import 'package:tic_tac_toe_app/theme/theme.dart';

class StartPage extends StatelessWidget {
  final boardService = locator<BoardService>();
  final soundService = locator<SoundService>();
  final alertService = locator<AlertService>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>Future.value(false),

      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration (
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1,0.65],
                colors: [
                  MyTheme.deepPick,
                  MyTheme.blueViolet,
                ], // colors
              ), // LinearGradient
            ), // BoxDecoration
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget> [
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text("Tic Tac",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 75,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Satisfy'), // TextStyle, Text
                      ),
                      Logo(),
                    ], // children
                  ), // Column
                ), // Flexible
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        onTap: () {
                          boardService.gameMode$.add(GameMode.Solo);
                          soundService.playSound('click');

                          Navigator.push(context, CupertinoPageRoute(
                            builder: (context)=>PickPage(),
                          ),); // Cupertino PageRoute
                        }, // opTap
                        height: 40,
                        width: 250,
                        borderRadius: 250,
                        color: Colors.white,
                        child: Text(
                          'single player'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ), // TextStyle
                        ), // Text
                      ), // Button
                      SizedBox(height: 30),
                      Button(
                        onTap: (){
                          boardService.gameMode$.add(GameMode.Multi);
                          soundService.playSound('click');

                          Navigator.push(context, CupertinoPageRoute(
                            builder: (context)=>GamePage(),
                          ),); // CupertinoPageRoute
                          },
                          height: 40,
                          width: 250,
                          borderRadius: 250,
                          color: Colors.white,
                          child: Text(
                          'with friend'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.black.withOpacity(.8),
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                            ), // TextStyle
                          ), // Text
                          ), // Button
                      SizedBox(height: 60),
                      Button(
                        onTap: (){
                          soundService.playSound('click');
                         Navigator.push(context, CupertinoPageRoute(
                           fullscreenDialog: true,
                           builder: (context) => SettingsPage(),
                          ),); // CupertinoPageRoute
                      }, // onTap
                      height: 50,
                      width: 50,
                      borderRadius: 25,
                      color: Colors.white,
                      child: Icon(Icons.settings),
                    ), // Button
                   ], // children
                  ), // Column
                ), // Flexible
              ], // children
            ), // Column
          ), // Container
        ), // Scaffold
      ), // SafeArea
    ); // WillPopScope
  } // build
} // StartPage
