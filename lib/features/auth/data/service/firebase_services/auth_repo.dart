import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Sign up failed");
    }
  }

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Login failed");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
