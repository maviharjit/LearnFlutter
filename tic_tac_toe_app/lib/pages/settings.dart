import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe_app/services/provider.dart';
import 'package:tic_tac_toe_app/services/sound.dart';
import 'package:tic_tac_toe_app/services/theme.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
} // SettingsPage

class _SettingsPageState extends State<SettingsPage> {
  final soundService = locator<SoundService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: soundService.enableSound$,
      builder: (context,AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
         return Container();
      }
        final bool isSoundEnabled = snapshot.data;
        return Scaffold (
          body: Container(
          width: MediaQuery.of(context).size.width;
          child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("settings".toUpperCase(),
                      style: TextStyle(),
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize:30,
                      ),) // TextStyle, Text
                    ],), // Row
                  ),  // Padding
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Enable Sound",
                        style: TextStyle(
                          color: Colors.black,
                          font.size: 20,
                      ), // TextStyle
                    ), // Text
                    Expanded(
                      child: Container(),
                    ), // Expanded
                      CupertinoSwitch(
                        onChanged: (e){
                          soundService.enableSound$.add(e);
                        },
                        value: isSoundEnabled,
                        activeColor: MyTheme.deepPick,
                      ) // CupertinoSwitch
                    ],
                  ), // Row
                ],
              ), // Column

          ), // Padding
          ), // Container
        ), // Scaffold
    ); // StreamBuilder
    } // build
    } // _SettingsPageState