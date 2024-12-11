import 'package:ecommerce/pages/productdetail.dart';
import 'package:ecommerce/utils/color.dart';
import 'package:ecommerce/utils/priceformate.dart';
import 'package:ecommerce/widget/mynetworkimage.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  final String categoryName;
  final List<Map<String, dynamic>> products;
  const CategoriesList(
      {super.key, required this.categoryName, required this.products});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
        backgroundColor: whiteShade,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65,
            // mainAxisExtent: 350,
          ),
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            final product = widget.products[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetail(product: product)));
              },
              child: Card(
                color: whiteShade,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: MyNetworkImage(
                              imageUrl: product['image']!,
                              fit: BoxFit.cover,
                              imgWidth: double.infinity),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text("Product Id :- ${product["id"].toString()}"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        product["name"]!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        PriceFormate(product['price']!),
                        // product['price'].toStringAsFixed(2)!,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
