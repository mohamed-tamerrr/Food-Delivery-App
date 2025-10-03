import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuth _auth;
  AuthRepo(FirebaseAuth? auth)
    : _auth = auth ?? FirebaseAuth.instance;
  Future<UserCredential> signIn({
    required email,
    required password,
  }) async {
    UserCredential user = await _auth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        );
    return user;
  }

  Future<UserCredential> signUp({
    required email,
    required password,
  }) async {
    UserCredential user = await _auth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
// TODO : finish auth and learn how to listen to state to know if we will stay logged or not