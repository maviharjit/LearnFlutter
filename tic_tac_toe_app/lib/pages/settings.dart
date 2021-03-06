import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe_app/services/provider.dart';
import 'package:tic_tac_toe_app/services/sound.dart';
import 'package:tic_tac_toe_app/theme/theme.dart';

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
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
         return Container();
      }
        // this is working now
        final bool isSoundEnabled = snapshot.data;
        return Scaffold (
          body: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                    children: <Widget> [
                      Text("settings".toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize:30,
                      ),
                      ), // TextStyle, Text
                    ],
                    ), // Row
                  ),  // Padding
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Enable Sound",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                      ), // TextStyle
                    ), // Text
                    Expanded(child: Container(),
                    ), // Expanded
                      CupertinoSwitch(
                        onChanged: (e){
                          soundService.enableSound$.add(e);
                        },
                        // this is working now
                        value: isSoundEnabled,
                        activeColor: MyTheme.deepPick,
                      ), // CupertinoSwitch
                    ], // children
                  ), // Row
                ], // Children
              ), // child column Container
            ), // Padding
          ), // Container
        ); // Scaffold
      }); // StreamBuilder
  } // build
} // _SettingsPageState