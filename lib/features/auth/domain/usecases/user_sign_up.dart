import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usecase<User, UserSignUpParameters> {
  final AuthRepository authRepository;
  UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserSignUpParameters params) async {
    return authRepository.signupWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParameters {
  final String name;
  final String email;
  final String password;

  UserSignUpParameters(
      {required this.name, required this.email, required this.password});
}
