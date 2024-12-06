import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CartPrefrence {
  static Future<void> addToCart(Map<String, dynamic> product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> cart = prefs.getStringList("cart") ?? [];

    cart.add(json.encode(product));

    prefs.setStringList('cart', cart);
  }

  static Future<List<Map<String, dynamic>>> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cart = prefs.getStringList('cart') ?? [];
    return cart
        .map((item) => json.decode(item) as Map<String, dynamic>)
        .toList();
  }

  static Future<void> removeFromCart(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cart = prefs.getStringList("cart") ?? [];

    cart.removeWhere((item) {
      Map<String, dynamic> product = json.decode(item);
      return product['id'].toString() == productId;
    });

    prefs.setStringList('cart', cart);
  }
}
