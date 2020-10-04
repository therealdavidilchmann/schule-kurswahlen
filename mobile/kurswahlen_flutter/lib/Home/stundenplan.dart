import 'package:flutter/material.dart';
import 'package:kurswahlenflutter/HelperClasses/day.dart';
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
    Day("Montag", ["Mathe", "Info"]),
    Day("Dienstag", ["Deutsch", "Englisch"]),
    Day("Mittwoch", ["Chemie", "Physik"]),
  ];
}
