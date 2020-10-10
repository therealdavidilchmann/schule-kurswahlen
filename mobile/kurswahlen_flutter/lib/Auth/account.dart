import 'dart:ffi';

import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  String _uid = "8347597597482";
  String _amountOfClasses = "12";
  String _amountOfClassesPerWeek = "34";
  @override
  _AccountState createState() => _AccountState();
}

class UserStatsContainer {
  final double userStatsContainerWidth = 200;
  final BoxDecoration userStatsContainerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );
  final TextStyle userStatsTextStyle = TextStyle(
    fontSize: 20,
  );
}

class _AccountState extends State<Account> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Account"),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: userStatsContainerWidth,
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              decoration: userStatsContainerDecoration,
              child: Text(
                "ID",
                style: userStatsTextStyle,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              decoration: userStatsContainerDecoration,
              child: Text(
                "Wochenstunden",
                style: userStatsTextStyle,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              decoration: userStatsContainerDecoration,
              child: Text(
                "Anzahl an Klassen",
                style: userStatsTextStyle,
              ),
            ),
          ],
        ));
  }
}