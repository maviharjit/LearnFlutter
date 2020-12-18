import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertService {
  
  // data members
  AlertStyle _resultAlertStyle;
  AlertStyle _settingsAlertStyle;

  // getters
  AlertStyle get resultAlertStyle => _resultAlertStyle;
  AlertStyle get settingAlertStyle => _settingsAlertStyle;

  // constructor
  AlertService(){
    _resultAlertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      titleStyle: TextStyle(
        color: Color(0xff111111),fontWeight: FontWeight.w700,fontSize: 25
      ),
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(microseconds: 300),
      buttonAreaPadding: EdgeInsets.all(12),
      overlayColor: Colors.black.withOpacity(.7),
      constraints: BoxConstraints(maxHeight: 200,maxWidth: 250),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );

    _settingsAlertStyle = AlertStyle(
      animationType: AnimationType.fromBottom,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      titleStyle: TextStyle(
        color: Color(0xff111111),
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),
      buttonAreaPadding: EdgeInsets.all(12),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}