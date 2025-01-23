import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignIn implements Usecase<User, UserSignInParams> {
  final AuthRepository authRepository;

  UserSignIn({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(UserSignInParams params) async {
    return await authRepository.signinWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({required this.email, required this.password});
}
