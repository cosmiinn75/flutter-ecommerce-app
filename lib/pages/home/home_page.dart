import 'package:e_commerce/pages/account/account_page.dart';
import 'package:e_commerce/pages/auth/sign_up_page.dart';
import 'package:e_commerce/pages/cart/cart_history.dart';
import 'package:e_commerce/pages/cart/cart_page.dart';
import 'package:e_commerce/pages/home/main_food_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
   SignUpPage(),
    CartHistory(),
    AccountPage()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          currentIndex: _selectedIndex,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),  label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.archive), label: "history"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "me"),

            ]
      ),
    );
  }
}
