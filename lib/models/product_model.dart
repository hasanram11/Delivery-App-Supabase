class ProductModel {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final bool isAvailable;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isAvailable,
  });

  factory ProductModel.fromFirestore(
    String id,
    Map<String, dynamic> data,
  ) {
    return ProductModel(
      id: id,
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      imageUrl: data['imageUrl'] ?? '',
      isAvailable: data['isAvailable'] ?? true,
    );
  }
}
