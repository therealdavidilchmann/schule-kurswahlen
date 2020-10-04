import 'package:flutter/material.dart';
import 'package:kurswahlenflutter/HelperClasses/day.dart';

class RowItem extends StatefulWidget {
  bool _isShowingClasses;
  Day _day;

  RowItem(Day day) {
    this._isShowingClasses = false;
    this._day = day;
  }
  
  @override
  _RowItemState createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Material(
            child: InkWell(
              onTap: () => print("Pressed"),
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
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
              ),
            )
          ),
          Column(
            children: [
              Container(
                child: Center(child: Text("Classes")),
                width: MediaQuery.of(context).size.width,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(2.0))
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}