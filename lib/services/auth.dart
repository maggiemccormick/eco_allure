import 'package:firebase_auth/firebase_auth.dart';
import 'package:eco_allure/models/ecoallure_user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on User
  EcoAllureUser? _userFromFirebase(User user) {
    return user != null ? EcoAllureUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<EcoAllureUser?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebase(user!));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      // UserCredential is same as AuthResult
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch(e) {
        print(e.toString());
        return null;
    }
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}