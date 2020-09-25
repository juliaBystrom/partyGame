import 'package:firebase_auth/firebase_auth.dart';
import 'package:pg_app/models/user_gameinfo.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Turns the User object from the Firebase_auth to an User object of our own class
  UserGameInfo _getUserInfo(User user) {
    return user != null ? UserGameInfo(userId: user.uid) : null;
  }

  // Anonymsly sign In
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _getUserInfo(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Returns an strem of UserGameInfo
  Stream<UserGameInfo> get userStream {
    return _auth.onAuthStateChanged.map((User user) => _getUserInfo(user));
  }

  // Log out function
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _getUserInfo(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in user with email and password
  Future signInEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _getUserInfo(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
