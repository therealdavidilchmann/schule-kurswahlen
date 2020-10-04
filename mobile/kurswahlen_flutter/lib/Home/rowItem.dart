import 'package:flutter/material.dart';
import 'package:kurswahlenflutter/HelperClasses/day.dart';
import 'package:kurswahlenflutter/HelperClasses/subject.dart';

class RowItem extends StatefulWidget {
  Day _day;

  RowItem(Day day) {
    this._day = day;
  }

  @override
  _RowItemState createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {
  var isShowingClasses;
  var isInitialized = false;

  void toggleClassesExitension() {
    setState(() {
      this.isShowingClasses = !this.isShowingClasses;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!this.isInitialized) {
      this.isShowingClasses =
          checkIfRowIsCurrentDay(this.widget._day.getName());
      this.isInitialized = true;
    }
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Material(
                child: InkWell(
              onTap: () => toggleClassesExitension(),
              child: Container(
                child: Center(
                  child: Text(
                    widget._day.getName(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(180, 180, 180, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            )),
            Visibility(
              visible: this.isShowingClasses,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                    children: widget._day
                        .getClasses()
                        .map(
                          (c) => Container(
                            child: rowExtension(c, context),
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0))),
                          ),
                        )
                        .toList()),
              ),
            )
          ],
        ));
  }
}

Widget rowExtension(Subject subject, BuildContext context) {
  final double contentWidth = MediaQuery.of(context).size.width - 42;
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: contentWidth / 3,
          child: Text(
            subject.getRoom(),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: contentWidth / 3,
          child: Text(
            subject.getName(),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: contentWidth / 3,
          child: Text(
            subject.getTeacher(),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

bool checkIfRowIsCurrentDay(String rowDay) {
  int currentDay = DateTime.now().weekday;
  List<String> allDays = [
    "Montag",
    "Dienstag",
    "Mittwoch",
    "Donnerstag",
    "Freitag"
  ];

  for (int i = 0; i < allDays.length; i++) {
    try {
      if (rowDay == allDays[currentDay-1]) return true;
    } catch (e) {
      return false;
    }
  }
  return false;
}
