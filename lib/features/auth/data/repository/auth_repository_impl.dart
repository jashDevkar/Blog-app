import 'package:blog_app/core/exception/server_exception.dart';
import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/features/auth/data/datasource/remote_database.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, String>> signinWithEmailPassword(
      {required String name, required String email, required String password}) {
    // TODO: implement signinWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signupWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await authRemoteDataSource.signUpWithEmailPassword(
          name: name, email: email, password: password);

      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
