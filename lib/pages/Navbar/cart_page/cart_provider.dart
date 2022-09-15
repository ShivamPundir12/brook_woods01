import 'package:flutter/material.dart';

class CartItem {
  final List image;
  final String name;
  final String price;
  final int qty;

  CartItem({
    required this.image,
    required this.name,
    required this.price,
    required this.qty,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  int qty = 0;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem({required price, name, image}) {
    if (_items.containsKey(name)) {
      _items.update(
          name,
          (value) => CartItem(
              image: value.image.toList(),
              name: value.name,
              price: value.price,
              qty: value.qty + 1));
      notifyListeners();
    } else {
      _items.putIfAbsent(
          name,
          () => CartItem(
                image: image,
                name: name.toString(),
                price: price.toString(),
                qty: 1,
              ));
      notifyListeners();
    }
  }

  double get totalToPay {
    double total = 0;
    _items.forEach((key, value) {
      total += double.parse(value.price) * value.qty;
    });
    return total;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void remove({required price, name, image}) {
    if (_items.containsKey(name)) {
      _items.update(
          name,
          (value) => CartItem(
              image: value.image.toList(),
              name: value.name,
              price: value.price,
              qty: value.qty - 1));
      notifyListeners();
    } else {
      _items.putIfAbsent(
          name,
          () => CartItem(
                image: image,
                name: name.toString(),
                price: price.toString(),
                qty: 1,
              ));
      notifyListeners();
    }
  }
}
