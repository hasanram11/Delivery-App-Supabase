import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  final _client = Supabase.instance.client;

  Future<String> getUserRole() async {
    final userId = _client.auth.currentUser!.id;

    final response = await _client
        .from('profiles')
        .select('role')
        .eq('id', userId)
        .single();

    return response['role'];
  }
}
