import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  // Add product to cart
  void addToCart(Map<String, dynamic> product) {
    // Add original price and initial quantity (1) to product when adding to cart
    _cartItems.add({
      ...product,
      'originalPrice': product['price'],
      'quantity': 1, // Initial quantity is 1
    });
    notifyListeners();
  }

  // Remove product from cart
  void removeFromCart(Map<String, dynamic> product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  // Update product quantity (increment or decrement)
  void updateProductQuantity(Map<String, dynamic> product, bool isIncrement) {
    final index = _cartItems.indexOf(product);
    if (index != -1) {
      if (isIncrement) {
        // Increment the quantity
        _cartItems[index]['quantity'] += 1;
      } else {
        // Decrement the quantity (make sure quantity does not go below 1)
        if (_cartItems[index]['quantity'] > 1) {
          _cartItems[index]['quantity'] -= 1;
        }
      }
      // Update the price according to the quantity
      _cartItems[index]['price'] =
          _cartItems[index]['originalPrice'] * _cartItems[index]['quantity'];
      notifyListeners();
    }
  }

  // Get total amount
  double get totalAmount {
    return _cartItems.fold(0.0, (sum, item) => sum + item['price']);
  }

  // Get total number of cart items
  int get cartCount => _cartItems.length;
}
