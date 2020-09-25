import 'package:flutter/material.dart';
import 'package:pg_app/services/auth.dart';
import 'package:pg_app/shared/globals.dart';

class SignIn extends StatefulWidget {
  Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthenticationService _auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String email = '';
  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign in"),
        elevation: 0,
        backgroundColor: Colors.pink[900],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        /* child: RaisedButton(
          child: Text("Sign in anonymsly"),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if(result == null){
              print("Error signing in");
            }else{
              print("Sucsessfull sign in");
              print(result);
            }
          },
        ), */
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                decoration:
                    inputDecorationTextField.copyWith(hintText: "Email"),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
                decoration:
                    inputDecorationTextField.copyWith(hintText: "Password"),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result =
                            await _auth.signInEmailPass(email, password);
                        if (result == null) {
                          setState(() {
                            error =
                                'Unable to sign in with that email or password';
                          });
                        }
                      }
                    },
                  ),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Create acount',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result =
                            await _auth.registerEmailPass(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Please supply a valid email';
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
