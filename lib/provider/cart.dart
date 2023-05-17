import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.title,
    required this.price,
    required this.id,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get itemCount {
    return _items.length;
  }

  void removeItem(String ProductID) {
    _items.remove(ProductID);
    notifyListeners();
  }

  void removeSingleItem(String ProductID) {
    if (!_items.containsKey(ProductID)) {
      return;
    }

    if (_items[ProductID]!.quantity > 1) {
      _items.update(
        ProductID,
        (existingCartItem) => CartItem(
            title: existingCartItem.title,
            price: existingCartItem.price,
            id: existingCartItem.id,
            quantity: existingCartItem.quantity - 1),
      );
    } else {
      _items.remove(ProductID);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void addItem(String productID, double price, String title) {
    if (_items.containsKey(productID)) {
      _items.update(
          productID,
          (ExistingCardItem) => CartItem(
                title: ExistingCardItem.title,
                price: ExistingCardItem.price,
                id: ExistingCardItem.id,
                quantity: ExistingCardItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
        productID, // yahan product id kon sa jayega jb wo id aaya hi ni
        () => CartItem(
            title: title,
            price: price,
            id: DateTime.now().toString(),
            quantity: 1),
      );
    }
    notifyListeners();
  }
}
