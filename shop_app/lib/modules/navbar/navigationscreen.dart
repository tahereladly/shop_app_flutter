import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_20233/modules/bottom_nav_pages/carts/Carts_Screen.dart';
import 'package:iti_20233/modules/bottom_nav_pages/category/Category_Screen.dart';
import 'package:iti_20233/modules/bottom_nav_pages/home/Home_Bar.dart';
import 'package:iti_20233/modules/bottom_nav_pages/profile/Profile_Screen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeBar(),
    CategoryScreen(),
      CartScreen(),
     const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 17,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xffFF8B40),
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [

          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled,color: Colors.grey,), label: "Home",),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined,color: Colors.grey,), label: "Category",),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart,color: Colors.grey,), label: "Carts",),

          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,color: Colors.grey,), label: "Profile",),
        ],
      ),
    );
  }
}
