import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedItem;
  final Function(int) onTap;
  const BottomNavBar(
      {super.key, required this.selectedItem, required this.onTap});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black,
      child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.02),
        child: GNav(
          gap: 10,
          tabBorderRadius: 100,
          backgroundColor: Colors.black,
          activeColor: Colors.white,
          tabBackgroundGradient: const LinearGradient(colors: [
            Colors.blueAccent,
            Colors.deepPurple,
            Colors.purpleAccent,
            Colors.orangeAccent,
            Colors.deepOrange,
            //Colors.black,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          iconSize: 30,
          textSize: 16,
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.01, vertical: h * 0.02),
          tabs: const [
            GButton(
              icon: CupertinoIcons.home, iconColor: Colors.white,
              text: 'Home',
            ),
            GButton(
              icon: Icons.category,iconColor: Colors.white,
              text: 'Categories',
            ),
            GButton(
              icon: Icons.search,iconColor: Colors.white,
              text: 'Search',
            ),
            GButton(
              icon: Icons.bookmark,iconColor: Colors.white,
              text: 'Saved',
            ),
            GButton(
              icon: CupertinoIcons.shopping_cart,iconColor: Colors.white,
              text: 'Shopping',
            ),
          ],
          onTabChange: widget.onTap,
          selectedIndex: 0,
        ),
      ),
    );
  }
}
