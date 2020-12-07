import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/components/button.dart';
import 'package:tic_tac_toe_app/components/logo.dart';
import 'package:tic_tac_toe_app/page/game.dart';
import 'package:tic_tac_toe_app/page/pick.dart';
import 'package:tic_tac_toe_app/page/setting.dart';
import 'package:tic_tac_toe_app/services/alert.dart';
import 'package:tic_tac_toe_app/services/board.dart';
import 'package:tic_tac_toe_app/services/provider.dart';
import 'package:tic_tac_toe_app/services/sound.dart';
import 'package:tic_tac_toe_app/theme/theme.dart';

class StartPage extends StatelessWidget {
  final boardService = locator<BoardService>();
  final soundService = locator<SoundService>();
  final alertService = locator<alertService>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>Futurevalue(false),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width;
            decoration: BoxDecoration (
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1,0.65],
                colors: [
                  MyTheme.deepPick,
                  MyTheme.blueViolet,
                ],
              ), // LinearGradient
            ), // BoxDecoration
            child: Column(
              mainAxisSize: MainAxisSize.max;
              children: [
                Flexible(
                  flex: 1
                  child: Column(
                    mainAxisSize: MainAxisSize.max;
                    mainAxisAlignment: mainAxisAlignment.center,
                    children: [
                      Text('Tic Tac',
                      style: TextStyle(
                        color: Colors.white;
                        fontSize: 75,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Satisfy'
                      ),) // TextStyle, Text
                      Logo(),
                    ]
                  ), // Column
                ), // Flexible
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max;
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        onTap: () {
                          boardService.gameMode$.add(GameMode.Solo);
                          soundService.playSound('click');
                          Navigator.push(context, CupertinoPageRoute(
                            builder: (context)=>PickPage(),
                          ),); // CupertinoPageRoute
                        },
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
                      SizedBox(height: 30,),
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
                          ),
                        },
                      ), // Button
                      SizedBox(height: 30,),
                      Button(
                        onTap: (){
                          soundService.playSound('click');
                         Navigator.push(context, CupertinoPageRoute(
                           builder: (context)=>SettingPage(),
                          ),); // CupertinoPageRoute
                      },
                      height: 40,
                      width: 250,
                      borderRadius: 250,
                      color: Colors.white,
                      child: Icon(Icons.settings),
                    ), // Button
                   ],
                  ), // Column
                ), // Flexible
              ]
            ),
          ), // Container
        ), // Scaffold
      ), // SafeArea
    ),
  } // build
} // StartPage
