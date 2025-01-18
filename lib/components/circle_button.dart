import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const CircleButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    return Column(
      children: [
        CircleAvatar(
          radius: w*0.05,
          backgroundColor: Colors.deepOrange,
          child: Icon(icon,color: Colors.white,),
        ),
        SizedBox(height: w*0.01,),
        Text(label,style: TextStyle(
          fontSize: w*0.03,
          color: Colors.black
        ),)
      ],
    );
  }
}