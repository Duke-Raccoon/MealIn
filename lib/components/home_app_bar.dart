
import 'package:flutter/material.dart';
import 'package:recipeapp/constants/images_path.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final w= MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Row(
      
      children: [
        Text('What are you\ncooking today?',style: TextStyle(
          fontSize: w*0.06,
          height: 1,
          fontWeight: FontWeight.bold,
          color: Colors.pinkAccent,
        ),),
        SizedBox(
            width: w* 0.1,
        ),
        Container(
                height: h * 0.1,
                width: w*0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImagesPath.drink), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)
                ),
              ),
              SizedBox(
            width: w* 0.01,
        ),
        Container(
                height: h * 0.1,
                width: w*0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImagesPath.chocolate), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)
                ),
              ),
              SizedBox(
            width: w* 0.01,
        ),
        Container(
                height: h * 0.1,
                width: w*0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImagesPath.vegetable), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)
                ),
              ),

        
        const Spacer()
      ],
      
    );
  }
}