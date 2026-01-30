import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  // CUSTOMER SIGNUP
  Future<void> registerCustomer({
    required String email,
    required String password,
  }) async {
    final res = await _supabase.auth.signUp(
      email: email,
      password: password,
    );

    final user = res.user;
    if (user == null) {
      throw Exception('Signup failed');
    }

    await _supabase.from('profiles').insert({
      'id': user.id,
      'email': email,
      'role': 'customer',
    });
  }

  // LOGIN
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // GET ROLE
  Future<String> getRole() async {
    final user = _supabase.auth.currentUser;
    if (user == null) throw Exception('Not logged in');

    final data = await _supabase
        .from('profiles')
        .select('role')
        .eq('id', user.id)
        .single();

    return data['role'];
  }

  Future<void> logout() async {
    await _supabase.auth.signOut();
  }
}
