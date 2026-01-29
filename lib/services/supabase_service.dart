import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://hrpnzwqjelqqgzovmjdv.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhycG56d3FqZWxxcWd6b3ZtamR2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1ODY5NjcsImV4cCI6MjA4NTE2Mjk2N30.cajwn0VaYgO7WYB_q4B0bkfmTY8FIibizkTsD665j30',
    );
  }

  static SupabaseClient get client =>
      Supabase.instance.client;
}
