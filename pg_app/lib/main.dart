import 'package:flutter/material.dart';
import 'package:pg_app/models/user_gameinfo.dart';
import 'package:pg_app/screens/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pg_app/services/auth.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserGameInfo>.value(
      value: AuthenticationService().userStream,
      child: MaterialApp(
      home: Root(),
      ),
    );
  }
}
