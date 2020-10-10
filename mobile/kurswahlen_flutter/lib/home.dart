import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoggedIn = false;

  final BoxDecoration buttonDecoration = BoxDecoration(boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(200, 200, 200, 1),
      blurRadius: 3,
      spreadRadius: 4,
    )
  ]);

  Material button(String text, Function onClick) {
    return Material(
      child: InkWell(
        onTap: () => onClick(),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Text(text)
        ),
      ),
    );
  }

  void _changeVisibility() {
    setState(() {
      this._isLoggedIn = !this._isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: null,
        actions: [
          Visibility(
            visible: this._isLoggedIn,
            child: IconButton(
              icon: Icon(Icons.account_circle), 
              onPressed: () => Navigator.pushNamed(context, "/account")
            )
          ),
          Visibility(
              visible: !this._isLoggedIn,
              child: FlatButton(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  _changeVisibility();
                },
              ))
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: this._isLoggedIn,
            child: Column(
              children: [
                Container(
                  decoration: buttonDecoration,
                  margin: EdgeInsets.all(20),
                  child: button('Stundenplan', () => Navigator.pushNamed(context, '/stundenplan')),
                ),
                Container(
                  decoration: buttonDecoration,
                  margin: EdgeInsets.all(20),
                  child: button('Lehrerliste', () => Navigator.pushNamed(context, '/lehrerliste')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
