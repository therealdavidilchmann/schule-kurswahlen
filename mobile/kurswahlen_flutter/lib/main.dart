import 'package:flutter/material.dart';
import 'package:kurswahlenflutter/Auth/account.dart';
import 'package:kurswahlenflutter/Auth/login.dart';
import 'package:kurswahlenflutter/Home/stundenplan.dart';
import 'package:kurswahlenflutter/Lehrerliste/lehrerliste.dart';
import 'package:kurswahlenflutter/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var isLoggedIn = false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isLoggedIn ? '/' : '/login'),
      routes: {
        '/': (context) => viewContainerWrapper(Home()),
        '/login': (context) => viewContainerWrapper(Login()),
        '/stundenplan': (context) => viewContainerWrapper(Stundenplan()),
        '/lehrerliste': (context) => viewContainerWrapper(Lehrerliste()),
        '/account': (context) => viewContainerWrapper(Account())
      },
    );
  }
}

Widget viewContainerWrapper(Widget insert) {
  return SafeArea(child: insert);
}
