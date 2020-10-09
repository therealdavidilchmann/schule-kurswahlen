import 'package:flutter/material.dart';
import 'package:kurswahlenflutter/HelperClasses/teacher.dart';
import 'package:kurswahlenflutter/Lehrerliste/rowItem.dart';
import './rowItem.dart';

class Lehrerliste extends StatefulWidget {
  @override
  _LehrerlisteState createState() => _LehrerlisteState();
}

class _LehrerlisteState extends State<Lehrerliste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lehrerliste'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: teachers.map((teacher) => RowItem(teacher)).toList(),
        ),
      ),
    );
  }
}

final List<Teacher> teachers = [
  Teacher("Jost", "JO", "Mathe"),
  Teacher("Schützkowski", "SK", "Informatik"),
  Teacher("Niederhoffer", "NI", "Deutsch"),
  Teacher("Höpker", "HOE", "Chemie"),
  Teacher("Hahn", "HN", "Musik"),
  Teacher("Faßmann", "FN", "Sport"),
  Teacher("Flad", "FD", "Geschichte"),
  Teacher("Kreiser", "KRE", "Religion"),
  Teacher("Chugg", "CHG", "Chemie"),
  Teacher("Otto", "OT", "PoWi")
];