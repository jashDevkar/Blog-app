import 'package:blog_app/core/exception/server_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword(
      {required String name, required String email, required String password});
  Future<String> signInWithEmailPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabaseClient;
  AuthRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<String> signInWithEmailPassword({required String email, required String password}) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final res = await _supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});

      if (res.user == null) {
        throw ServerException('User is null');
      }

      return res.session!.user.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
