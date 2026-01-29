import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _client = Supabase.instance.client;

  Future<void> login(String email, String password) async {
    await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String role,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
    );

    final user = response.user;
    if (user == null) {
      throw Exception('Registration failed');
    }

    await _client.from('profiles').insert({
      'id': user.id,
      'email': email,
      'role': role,
    });
  }

  Future<void> logout() async {
    await _client.auth.signOut();
  }
}
