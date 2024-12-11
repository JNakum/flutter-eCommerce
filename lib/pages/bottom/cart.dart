import 'dart:developer';

import 'package:ecommerce/provider/cartprovider.dart';
import 'package:ecommerce/utils/color.dart';
import 'package:ecommerce/utils/priceformate.dart';
import 'package:ecommerce/widget/mynetworkimage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // Get the cart provider instance
    var cartProvider = Provider.of<CartProvider>(context);
    List<Map<String, dynamic>> cart = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
        backgroundColor: whiteShade,
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text("Your Cart Is Empty"),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> product = cart[index];
                      return Card(
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: MyNetworkImage(
                                    imageUrl: product['image']!,
                                    imgHeight: 80,
                                    imgWidth: 90,
                                    fit: BoxFit.cover),
                                //     Image.network(
                                //   product['image']!,
                                //   width: 80,
                                //   height: 90,
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product['id'].toString()),
                                    Text(
                                      product['name']!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Price : ${product['price']}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .removeFromCart(product);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: red,
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        log("Product Increment Button Pressed");
                                        cartProvider.updateProductQuantity(
                                            product, true);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      product['quantity'].toString(),
                                      style: const TextStyle(
                                          fontSize: 18, color: black),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cartProvider.updateProductQuantity(
                                            product, false);
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // "Total: \$${cartProvider.totalAmount.toStringAsFixed(2)}",
                  "Total: ${PriceFormate(cartProvider.totalAmount)}",

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    log("Checkout Button Pressed");
                  },
                  style: ElevatedButton.styleFrom(),
                  child: const Text("Checkout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
