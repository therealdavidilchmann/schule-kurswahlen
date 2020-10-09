import 'package:flutter/material.dart';
import 'package:kurswahlenflutter/HelperClasses/teacher.dart';

class RowItem extends StatefulWidget {
  Teacher _teacher;

  RowItem(Teacher teacher) {
    this._teacher = teacher;
  }
  @override
  _RowItemState createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {
  @override
  Widget build(BuildContext context) {
    final double contentWidth = MediaQuery.of(context).size.width - 40;
    final double rowItemWidth = contentWidth / 3;
    final EdgeInsets rowItemPadding = EdgeInsets.only(top: 10);
    
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: rowItemPadding,
              width: rowItemWidth,
              child: Text(
                widget._teacher.name,
                textAlign: TextAlign.center,
              )),
          Container(
              padding: rowItemPadding,
              width: rowItemWidth,
              child: Text(
                widget._teacher.shortName,
                textAlign: TextAlign.center,
              )),
          Container(
              padding: rowItemPadding,
              width: rowItemWidth,
              child: Text(
                widget._teacher.subject,
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
