import 'product.dart';

/// Basit sepet yönetimi – Singleton pattern ile tüm sayfalardan erişilebilir.
class CartManager {
  // Singleton
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final List<Product> _items = [];

  /// Sepetteki ürünler (kopyası).
  List<Product> get items => List.unmodifiable(_items);

  /// Sepetteki ürün sayısı.
  int get itemCount => _items.length;

  /// Sepetin boş olup olmadığı.
  bool get isEmpty => _items.isEmpty;

  /// Ürün sepette mi?
  bool contains(Product product) {
    return _items.any((item) => item.id == product.id);
  }

  /// Sepete ürün ekle.
  bool add(Product product) {
    if (contains(product)) return false;
    _items.add(product);
    return true;
  }

  /// Sepetten ürün çıkar.
  void remove(Product product) {
    _items.removeWhere((item) => item.id == product.id);
  }

  /// Sepeti temizle.
  void clear() {
    _items.clear();
  }
}
