import 'package:blog_app/core/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signupWithEmailPassword(
      {required String name, required String email, required String password});

  Future<Either<Failure, String>> signinWithEmailPassword(
      {required String name, required String email, required String password});
}
