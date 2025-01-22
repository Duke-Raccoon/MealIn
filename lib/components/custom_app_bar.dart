import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool back;
  const CustomAppBar({super.key, required this.title, required this.back});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final w= MediaQuery.of(context).size.width;
    return AppBar(
      title: Text(title, style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: w * 0.06,
        color: Colors.white
      ),),
      centerTitle: true,
      backgroundColor: Colors.deepOrange,
      leading: back ? IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back, color: Colors.white,),
      ) : const Column(),
    );
  }
}