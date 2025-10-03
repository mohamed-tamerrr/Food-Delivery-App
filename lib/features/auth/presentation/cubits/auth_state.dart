part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFail extends AuthState {
  final String msgError;

  const AuthFail({required this.msgError});
}

final class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess({required this.user});
}
