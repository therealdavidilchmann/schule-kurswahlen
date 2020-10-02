import 'package:flutter/material.dart';
import 'package:kurswahlenflutter/Auth/login.dart';
import 'package:kurswahlenflutter/Home/stundenplan.dart';
import 'package:kurswahlenflutter/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var isLoggedIn = true;

    Widget homeView() {
      return (isLoggedIn ? Stundenplan() : Login());
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("B :)"),
          ),
          body: homeView()),
    );
  }
}
