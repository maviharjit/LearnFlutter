import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/components/button.dart';
import 'package:tic_tac_toe_app/components/o.dart';
import 'package:tic_tac_toe_app/components/x.dart';
import 'package:tic_tac_toe_app/services/board.dart';
import 'package:tic_tac_toe_app/services/provider.dart';
import 'package:tic_tac_toe_app/services/sound.dart';
import 'package:tic_tac_toe_app/theme/theme.dart';

import 'game.dart';
class PickPage extends StatefulWidget {
  @override
  _PickPageState createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  final boardService = locator<BoardService>();
  final soundService = locator<SoundService>();
  String groupValue = 'X';
  void setGroupValue(value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column (
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Pic Your Side",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'Satisfy'
                ), // TextStyle
              ), // Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: ()=>setGroupValue('X'),
                        child: X(100,12),
                      ), // GestureDetector
                      Radio(
                        onChanged: (e)=>setGroupValue(e),
                        activeColor: MyTheme.deepPick,
                        value: 'X',
                        groupValue: groupValue,
                      ), // Radio
                      Padding (
                        padding: const EdgeInsets.all(8),
                        child: Text (
                          'first',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Satisfy',
                            fontSize: 20,
                          ), // TextStyle
                        ), // Text
                      ), // Padding
                    ],
                  ), // Column
                  Column(children: [
                    GestureDetector(
                      onTap: ()=>setGroupValue('O'),
                      child: O(100,MyTheme.orange),
                    ), // GestureDetector
                    Radio(
                      onChanged: (e)=>setGroupValue(e),
                      activeColor: MyTheme.deepPick,
                      value: 'O',
                      groupValue: groupValue,
                    ), // Radio
                    Padding (
                      padding: const EdgeInsets.all(8),
                      child: Text (
                        'second',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Satisfy',
                          fontSize: 20,
                        ), // TextStyle
                      ), // Text
                    ), // Padding
                  ],), // Column
                ],
              ), // Row
              Button(
                onTap: (){
                  boardService.resetBoard();
                  boardService.setStart(groupValue);
                  if (groupValue == 'O') {
                    boardService.player$.add('X');
                    boardService.botMove();
                  }
                  soundService.playSound('click');
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => GamePage(),
                    ), // CupertinoPageRoute
                  ); // changed due to bug
                },
              ), // Button
            ],
          ), // Column
        ), // Container
      ), // Scaffold
    ); // SafeArea
  }
}
