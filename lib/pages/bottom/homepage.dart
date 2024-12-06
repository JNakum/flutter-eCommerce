import 'package:ecommerce/pages/bottom/cart.dart';
import 'package:ecommerce/pages/category.dart';
import 'package:ecommerce/utils/color.dart';
import 'package:ecommerce/widget/myimage.dart';
import 'package:ecommerce/widget/mysizebox.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: profileImage(),
          title: MyImage(
              height: 32, width: 84, imagePath: "bookalogo.png", radius: 0),
          centerTitle: true,
          backgroundColor: whiteShade,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_important_sharp)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const Cart()));
                },
                icon: const Icon(Icons.shopping_bag))
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              searchData(),
              const MySize(
                height: 20,
              ),
              categoryListProduct(),
            ],
          ),
        )));
  }

  profileImage() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.only(left: 15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage('assets/images/profile.jpg'), fit: BoxFit.fill),
        ),
      ),
    );
  }

  searchData() {
    return TextFormField(
      controller: _searchController,
      readOnly: true,
      decoration: InputDecoration(
        hintText: "Search Products",
        fillColor: whiteShade,
        border: InputBorder.none,
        prefixIcon: const Icon(
          Icons.search,
          color: colorPrimaryDark,
          size: 20,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.mic,
            size: 20,
            color: gery,
          ),
        ),
      ),
    );
  }

  categoryListProduct() {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Category()));
            },
            child: const Text("Show All Category"))
      ],
    );
  }
}
