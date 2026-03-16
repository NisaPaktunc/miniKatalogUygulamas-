import 'dart:convert';

class Product {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String price; // "$999" formatında
  final String currency;
  final String image;
  final Map<String, String> specs;

  Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.price,
    required this.currency,
    required this.image,
    required this.specs,
  });

  /// JSON'dan Product nesnesi oluşturur.
  factory Product.fromJson(Map<String, dynamic> json) {
    // specs alanını Map<String, String>'e çevir
    final rawSpecs = json['specs'] as Map<String, dynamic>? ?? {};
    final specs = rawSpecs.map((key, value) => MapEntry(key, value.toString()));

    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      tagline: json['tagline'] as String? ?? '',
      description: json['description'] as String,
      price: json['price'] as String,
      currency: json['currency'] as String? ?? 'USD',
      image: json['image'] as String,
      specs: specs,
    );
  }

  /// API yanıtındaki JSON string'ini Product listesine çevirir.
  static List<Product> parseList(String responseBody) {
    final Map<String, dynamic> parsed = jsonDecode(responseBody);
    final List<dynamic> products = parsed['data'] as List<dynamic>;
    return products
        .map((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
