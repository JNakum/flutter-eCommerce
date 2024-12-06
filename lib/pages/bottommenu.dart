import 'package:ecommerce/pages/bottom/cart.dart';
import 'package:ecommerce/pages/bottom/homepage.dart';
import 'package:ecommerce/pages/bottom/profile.dart';
import 'package:ecommerce/utils/color.dart';
import 'package:flutter/material.dart';

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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "Cart",
            ),
            BottomNavigationBarItem(
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
