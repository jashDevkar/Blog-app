part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSucess extends AuthState {
  final User uid;

  AuthSucess({required this.uid});

}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});
}
