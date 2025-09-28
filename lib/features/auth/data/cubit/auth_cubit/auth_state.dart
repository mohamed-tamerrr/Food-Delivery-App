part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFail extends AuthState {
  final String msgErr;

  const AuthFail({required this.msgErr});
}

final class AuthSuccess extends AuthState {}
