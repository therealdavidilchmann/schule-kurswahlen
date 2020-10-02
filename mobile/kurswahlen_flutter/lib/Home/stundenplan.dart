import 'package:flutter/material.dart';

class Stundenplan extends StatelessWidget {
  Widget getStundenplan() {
    return Column(children: <Widget>[getDays()[0], getDays()[1], getDays()[2]]);
  }

  Map<int, Widget> getDays() {
    return [
      Text("A"),
      Text("B"),
      Text("C"),
    ].asMap();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getStundenplan(),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
    );
  }
}
