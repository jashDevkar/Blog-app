import 'package:blog_app/core/exception/server_exception.dart';
import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/features/auth/data/datasource/remote_database.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, User>> signinWithEmailPassword({
  
    required String email,
    required String password,
  }) async {
    return _getUser(
        () async => await authRemoteDataSource.signInWithEmailPassword(
              email: email,
              password: password,
            ));
  }

  @override
  Future<Either<Failure, User>> signupWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    return _getUser(() async => await authRemoteDataSource
        .signUpWithEmailPassword(name: name, email: email, password: password));
  }

  Future<Either<Failure, User>> _getUser(Future<User> Function() fn) async {
    try {
      final user = await fn();

      return right(user);
    } on sb.AuthException catch (e) {
      return left(Failure(e.toString()));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
