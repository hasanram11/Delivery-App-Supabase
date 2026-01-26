import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/product_model.dart';

class ProductService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // =========================
  // ADD PRODUCT (ADMIN)
  // =========================
  Future<void> addProduct({
    required String name,
    required double price,
    required bool isAvailable,
    required File imageFile,
  }) async {
    final docRef = _db.collection('products').doc();

    // Upload image to Firebase Storage
    final ref = _storage.ref('products/${docRef.id}.jpg');
    await ref.putFile(imageFile);
    final imageUrl = await ref.getDownloadURL();

    // Save product to Firestore
    await docRef.set({
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'createdAt': Timestamp.now(),
    });
  }

  // =========================
  // GET PRODUCTS (CUSTOMER)
  // =========================
  Stream<List<ProductModel>> getProducts() {
    return _db
        .collection('products')
        .where('isAvailable', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return ProductModel.fromFirestore(
              doc.id,
              doc.data(),
            );
          }).toList();
        });
  }
}
