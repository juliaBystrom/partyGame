import 'package:flutter/material.dart';
import 'package:pg_app/models/user_gameinfo.dart';
import 'package:pg_app/screens/Home/home.dart';
import 'package:pg_app/screens/Login/authenticate.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserGameInfo>(context);
    print(user);

    return Container(
      child: user == null ? Authenticate() : Home(),
    );
  }
}
