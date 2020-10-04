import 'package:flutter/material.dart';
import 'package:kurswahlenflutter/HelperClasses/day.dart';
import 'package:kurswahlenflutter/HelperClasses/subject.dart';
import './rowItem.dart';

class Stundenplan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: getStundenplan(context),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
    );
  }
}

Widget getStundenplan(BuildContext context) {
  return Column(
    children: getDays().map((day) => RowItem(day)).toList(),
  );
}

List<Day> getDays() {
  return [
    Day(
      "Montag", 
      [
        Subject("Informatik", "611", "SK"),
        Subject("Chemie", "405", "HOE"),
        Subject("Musik", "103", "HN"),
        Subject("-", "-", "-"),
        Subject("Sport", "TH3", "FN"),
        Subject("Geschichte", "312", "FD")
      ]
    ),
    Day(
      "Dienstag", 
      [
        Subject("Religion", "333", "KRE"),
        Subject("Mathe", "421", "JO"),
        Subject("Informatik", "612", "SK")
      ]
    ),
    Day(
      "Mittwoch", 
      [
        Subject("Physik", "431", "CHG"),
        Subject("Deutsch", "334", "NI"),
        Subject("-", "-", "-"),
        Subject("-", "-", "-"),
        Subject("-", "-", "-"),
        Subject("PoWi", "312", "OT")
      ]
    ),
    Day(
      "Donnerstag", 
      [
        Subject("Deutsch", "334", "NI"),
        Subject("Englisch", "336", "STR"),
        Subject("Geschichte", "312", "FD"),
        Subject("-", "-", "-"),
        Subject("Physik", "431", "CHG"),
        Subject("Chemie", "405", "HOE")
      ]
    ),
    Day(
      "Freitag", 
      [
        Subject("-", "-", "-"),
        Subject("Mathe", "431", "JO"),
        Subject("PoWi", "312", "OT")
      ]
    ),
  ];
}
