import 'package:ecommerce/pages/categorieslist.dart';
import 'package:ecommerce/utils/color.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<Map<String, dynamic>> categories = [
    {"id": 1, "name": "Mens Clothing", "image": "assets/images/mens.jpg"},
    {"id": 2, "name": "Womens Clothing", "image": "assets/images/womens.jpg"},
    {
      "id": 3,
      "name": "Children Clothing",
      "image": "assets/images/children.jpg"
    },
  ];

  final Map<int, List<Map<String, dynamic>>> categoryProducts = {
    1: [
      {
        'id': 1,
        'name':
            'Brown Shirt sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',
        'price': '\$49.99',
        'image':
            'https://images.pexels.com/photos/1036627/pexels-photo-1036627.jpeg',
      },
      {
        'id': 2,
        'name': 'Blue Jeans',
        'price': '\$39.99',
        'image':
            'https://images.pexels.com/photos/1036627/pexels-photo-1036627.jpeg',
      },
      {
        'id': 3,
        'name': 'Blue T-shirts',
        'price': '\$89.99',
        'image':
            'https://images.pexels.com/photos/1036627/pexels-photo-1036627.jpeg',
      },
    ],
    2: [
      {
        'id': 4,
        'name': 'Red Dress',
        'price': '\$59.99',
        'image':
            'https://images.pexels.com/photos/871495/pexels-photo-871495.jpeg',
      },
      {
        'id': 5,
        'name': 'Black Skirt',
        'price': '\$39.99',
        'image':
            'https://images.pexels.com/photos/871495/pexels-photo-871495.jpeg',
      },
      {
        'id': 6,
        'name': 'Black T-shirts',
        'price': '\$39.99',
        'image':
            'https://images.pexels.com/photos/871495/pexels-photo-871495.jpeg',
      },
    ],
    3: [
      {
        'id': 7,
        'name': 'Kids T-Shirt',
        'price': '\$19.99',
        'image':
            'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg',
      },
      {
        'id': 8,
        'name': 'Children Shorts',
        'price': '\$25.99',
        'image':
            'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg',
      },
      {
        'id': 9,
        'name': 'Children Dresses',
        'price': '\$35.99',
        'image':
            'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        backgroundColor: whiteShade,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.65,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Card(
              color: whiteShade,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesList(
                        categoryName: categories[index]["name"]!,
                        products: categoryProducts[categories[index]["id"]]!,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image section
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child: Image.asset(
                          categories[index]["image"]!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // Name section
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categories[index]["name"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
