import 'package:ecommerce/pages/bottom/cart.dart';
import 'package:ecommerce/pages/bottom/homepage.dart';
import 'package:ecommerce/pages/bottom/profile.dart';
import 'package:ecommerce/provider/cartprovider.dart';
import 'package:ecommerce/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bottommenu extends StatefulWidget {
  const Bottommenu({super.key});

  @override
  State<Bottommenu> createState() => _BottommenuState();
}

class _BottommenuState extends State<Bottommenu> {
  int _currentIndex = 0;

  onchange(int item) {
    setState(() {
      _currentIndex = item;
    });
  }

  List screen = <Widget>[const Homepage(), const Cart(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen.elementAt(_currentIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Icon(
                    Icons.shopping_bag,
                  ),
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
              label: "Cart",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          iconSize: 25,
          // selectedFontSize: 12,
          onTap: onchange,
          elevation: 16.0,
          selectedItemColor: colorAccent,
          unselectedItemColor: ligthGreen,
          showSelectedLabels: true,
          backgroundColor: colorPrimary,
        ),
      ),
    );
  }
}
