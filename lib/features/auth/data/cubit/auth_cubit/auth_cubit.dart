import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/auth/data/service/firebase_services/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthRepo auth = AuthRepo();

  signIn({
    required String email,
    required String password,
  }) {
    emit(AuthLoading());

    try {
      auth.login(email: email, password: password);
      emit(AuthSuccess());
    } on Exception catch (e) {
      emit(AuthFail(msgErr: e.toString()));
    }
  }

  signUp({
    required String email,
    required String password,
  }) {
    emit(AuthLoading());

    try {
      auth.signUp(email: email, password: password);
      emit(AuthSuccess());
    } on Exception catch (e) {
      emit(AuthFail(msgErr: e.toString()));
    }
  }
}
