import 'package:blog_app/core/exception/server_exception.dart';
import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usecase<String, UserSignUpParameters> {
  final AuthRepository authRepository;
  UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(UserSignUpParameters params) async {
    try {
      final res = await authRepository.signupWithEmailPassword(
          name: params.name, email: params.email, password: params.password);

      return right(res.toString());
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

class UserSignUpParameters {
  final String name;
  final String email;
  final String password;

  UserSignUpParameters(
      {required this.name, required this.email, required this.password});
}
