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
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 12), // Adjust spacing
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.4), // Pink shadow for glow effect
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: GNav(
        gap: 1,
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Spread tabs evenly
        backgroundColor: Colors.transparent,
        activeColor: Colors.white,
        color: Colors.white70, // Unselected icon color
        tabBackgroundColor: Colors.white.withOpacity(0.2),
        tabBorderRadius: 100,
        iconSize: 28,
        textSize: 14,
        padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: 12),
        tabs: const [
          GButton(
            icon: CupertinoIcons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.food_bank_outlined,
            text: 'Categories',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.bookmark,
            text: 'Saved',
          ),
          GButton(
            icon: CupertinoIcons.shopping_cart,
            text: 'Cart',
          ),
        ],
          selectedIndex: 0,
          onTabChange: widget.onTap
      ),
    );
  }
}
