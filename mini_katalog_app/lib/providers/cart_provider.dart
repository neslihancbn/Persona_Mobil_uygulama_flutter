import 'package:flutter/foundation.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  final Map<int, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  int get itemCount => _items.values.fold(0, (s, i) => s + i.quantity);

  double get totalPrice => _items.values.fold(0.0, (s, i) => s + i.product.price * i.quantity);

  void add(Product product, {int quantity = 1}) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  void remove(Product product) {
    _items.remove(product.id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void updateQuantity(Product product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity = quantity;
      if (quantity <= 0) _items.remove(product.id);
      notifyListeners();
    }
  }
}
