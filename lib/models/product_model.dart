class Product {
  final String id;
  final String name;
  final double price;

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = (json['price'] as num).toDouble();
}
