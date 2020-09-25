import 'package:flutter/material.dart';
import 'package:pg_app/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Start game"),
        elevation: 0,
        backgroundColor: Colors.pink[900],
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person_outline),
            label: Text("logout"),
            onPressed: () async {
              await _auth.signOut(); 
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Text("home"),
      ),
    );
  }
}
