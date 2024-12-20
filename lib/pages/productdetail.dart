import 'dart:developer';
import 'package:ecommerce/pages/bottom/cart.dart';
import 'package:ecommerce/provider/cartprovider.dart';
import 'package:ecommerce/utils/color.dart';
import 'package:ecommerce/widget/mynetworkimage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package

class ProductDetail extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    // bool isInCart = Provider.of<CartProvider>(context)
    //     .isProductInCart(widget.product['id'].toString());
    // log("This is The add item in cart data => ${isInCart.toString()}");

    // CartProvider ka instance
    final cartProvider = Provider.of<CartProvider>(context);

    // Product cart me hai ya nahi
    bool isInCart =
        cartProvider.isProductInCart(widget.product['id'].toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']!),
        centerTitle: true,
        backgroundColor: whiteShade,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_bag, color: colorPrimaryDark),
                  if (Provider.of<CartProvider>(context).cartCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${Provider.of<CartProvider>(context).cartCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: MyNetworkImage(
                        imageUrl: widget.product['image']!,
                        fit: BoxFit.cover,
                        imgWidth: double.infinity,
                        imgHeight: 300,
                      ),
                      //     Image.network(
                      //   widget.product['image']!,
                      //   fit: BoxFit.cover,
                      //   width: double.infinity,
                      //   height: 300,
                      // ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text("Product Id :- ${widget.product['id'].toString()}"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.product['name']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.product["price"].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: successBG,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Product Info",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "A detailed description of the product goes here. This can include features, specifications, and more.",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: whiteShade,
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${widget.product['price'].toString()}\nUnit Price",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: successBG,
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     // Buy Button Action
                //     log("Buy Button Press");
                //   },
                //   style: ElevatedButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(
                //       vertical: 12,
                //       horizontal: 24,
                //     ),
                //   ),
                //   child: const Text("Buy Now"),
                // ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Use the CartProvider to add the product to the cart
                    log("Add to Cart Button Press");
                    if (isInCart) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const Cart()));
                    } else {
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(widget.product);
                      setState(() {});

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to Cart'),
                          behavior: SnackBarBehavior.floating,
                          showCloseIcon: true,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                  ),
                  child: Text(isInCart ? "Go to Cart" : "Add To Cart"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
