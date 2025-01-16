
import 'package:flutter/material.dart';
import 'package:recipeapp/components/bottom_nav_bar.dart';
import 'package:recipeapp/screens/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(selectedItem: currentIndex, onTap: (index){
        pageController.animateToPage(
          index, 
          duration: const Duration(milliseconds: 300), 
          curve: Curves.easeOut);
        setState(() {
          currentIndex = index;
        });
      },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const[
          HomePage(),
          Center(child: Text('Page 22'),),
          Center(child: Text('Page 3'),),
          Center(child: Text('Page 4'),),
          Center(child: Text('Page 5'),),
        ],
      ),
    );
  }
}
