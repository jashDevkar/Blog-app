import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_signin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  AuthBloc({required UserSignUp userSignup, required UserSignIn userSignin})
      : _userSignUp = userSignup,
        _userSignIn = userSignin,
        super(AuthInitial()) {
    on<AuthSignup>(_onAuthSignUp);
    on<AuthSignin>(_onAuthSignIn);
  }

  void _onAuthSignUp(AuthSignup event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final res = await _userSignUp(UserSignUpParameters(
        name: event.name, email: event.email, password: event.password));
    res.fold((l) => emit(AuthFailure(message: l.message)),
        (r) => emit(AuthSucess(uid: r)));
  }

  void _onAuthSignIn(AuthSignin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final res = await _userSignIn(
        UserSignInParams(email: event.email, password: event.password));
    res.fold((l) => emit(AuthFailure(message: l.message)),
        (r) => emit(AuthSucess(uid: r)));
  }
}
