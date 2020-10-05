import 'package:jiffy/jiffy.dart';
import 'package:flutter/material.dart';
import 'package:kurswahlenflutter/HelperClasses/day.dart';
import 'package:kurswahlenflutter/HelperClasses/subject.dart';
import './rowItem.dart';

class Stundenplan extends StatefulWidget {
  @override
  _StundenplanState createState() => _StundenplanState();
}

class _StundenplanState extends State<Stundenplan> {
  String _currentWeek = "";
  bool _isInitialized = false;
  void setCurrentWeek(String newWeek) {
    setState(() {
      this._currentWeek = newWeek;
    });
  }

  String getCurrentWeek() {
    int currentWeek = Jiffy().week;
    if (currentWeek % 2 == 0) {
      return "A";
    }
    return "B";
  }

  Widget getStundenplan(BuildContext context) {
    if (!this._isInitialized) {
      setCurrentWeek(getCurrentWeek());
      this._isInitialized = true;
    }
    List<Day> allDays = (this._currentWeek == "A" ? aWeek : bWeek);
    return Column(
      children: allDays.map((day) => RowItem(day)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stundenplan'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Container(
                child: FlatButton(
                  child: Text('Wechsel zu ' + (this._currentWeek == "A" ? "B" : "A") + " Woche"),
                  onPressed: () =>
                      setCurrentWeek(this._currentWeek == "A" ? "B" : "A"),
                ),
              ),
              getStundenplan(context),
            ]),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
          ),
        ));
  }
}

final List<Day> aWeek = [
  Day("Montag", [
    Subject("Informatik", "611", "07:55 - 09:25"),
    Subject("Chemie", "405", "09:45 - 11:15"),
    Subject("Musik", "103", "11:35 - 13:05"),
    Subject("-", "-", "-"),
    Subject("Sport", "TH3", "14:00 - 15:30"),
    Subject("Geschichte", "312", "15:45 - 17:15")
  ]),
  Day("Dienstag", [
    Subject("Religion", "333", "07:55 - 09:25"),
    Subject("Mathe", "421", "09:45 - 11:15"),
    Subject("Informatik", "612", "11:35 - 13:05")
  ]),
  Day("Mittwoch", [
    Subject("Physik", "431", "07:55 - 09:25"),
    Subject("Deutsch", "334", "09:45 - 11:15"),
    Subject("-", "-", "-"),
    Subject("-", "-", "-"),
    Subject("-", "-", "-"),
    Subject("PoWi", "312", "15:45 - 17:15")
  ]),
  Day("Donnerstag", [
    Subject("Deutsch", "334", "07:55 - 09:25"),
    Subject("Englisch", "336", "09:45 - 11:15"),
    Subject("Geschichte", "312", "11:35 - 13:05"),
    Subject("-", "-", "-"),
    Subject("Physik", "431", "14:00 - 15:30"),
    Subject("Chemie", "405", "15:45 - 17:15")
  ]),
  Day("Freitag", [
    Subject("-", "-", "-"),
    Subject("Mathe", "431", "09:45 - 11:15"),
    Subject("PoWi", "312", "11:35 - 13:05")
  ]),
];

final List<Day> bWeek = [
  Day("Montag", [
    Subject("Informatik", "611", "07:55 - 09:25"),
    Subject("Chemie", "405", "09:45 - 11:15"),
    Subject("Musik", "103", "11:35 - 13:05"),
    Subject("-", "-", "-"),
    Subject("Sport", "TH3", "14:00 - 15:30")
  ]),
  Day("Dienstag", [
    Subject("Religion", "333", "07:55 - 09:25"),
    Subject("Mathe", "423", "09:45 - 11:15"),
    Subject("Informatik", "612", "11:35 - 13:05")
  ]),
  Day("Mittwoch", [
    Subject("-", "-", "-"),
    Subject("Deutsch", "334", "09:45 - 11:15"),
    Subject("Mathe", "423", "11:35 - 13:05"),
    Subject("-", "-", "-"),
    Subject("-", "-", "-"),
    Subject("Englisch", "336", "15:45 - 17:15")
  ]),
  Day("Donnerstag", [
    Subject("Deutsch", "334", "07:55 - 09:25"),
    Subject("Englisch", "336", "09:45 - 11:15"),
    Subject("Geschichte", "312", "11:35 - 13:05"),
    Subject("-", "-", "-"),
    Subject("Physik", "431", "14:00 - 15:30"),
    Subject("Informatik", "611", "15:45 - 17:15")
  ]),
  Day("Freitag", [
    Subject("-", "-", "-"),
    Subject("Mathe", "431", "09:45 - 11:15"),
    Subject("PoWi", "312", "11:35 - 13:05")
  ]),
];
