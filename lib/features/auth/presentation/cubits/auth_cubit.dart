import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/core/services/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._auth) : super(AuthInitial());
  final AuthRepo _auth;

  Future<void> signIn({
    required email,
    required password,
  }) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await _auth.signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user: userCredential.user!));
    } catch (e) {
      emit(AuthFail(msgError: e.toString()));
    }
  }

  Future<void> signUp({
    required email,
    required password,
  }) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await _auth.signUp(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user: userCredential.user!));
    } catch (e) {
      emit(AuthFail(msgError: e.toString()));
    }
  }

  Future<void> signOut({
    required email,
    required password,
  }) async {
    emit(AuthLoading());
    try {
      await _auth.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFail(msgError: e.toString()));
    }
  }
}
