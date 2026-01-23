import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // REGISTER
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _db.collection('users').doc(userCredential.user!.uid).set({
      'uid': userCredential.user!.uid,
      'name': name,
      'email': email,
      'role': role,
      'createdAt': Timestamp.now(),
    });
  }

  // LOGIN
  Future<String> login({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final doc = await _db
        .collection('users')
        .doc(userCredential.user!.uid)
        .get();

    return doc['role'];
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }

  // CURRENT USER
  User? get currentUser => _auth.currentUser;
}
