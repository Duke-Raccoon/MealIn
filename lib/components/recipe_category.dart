import 'package:flutter/material.dart';
import 'package:recipeapp/screens/all_recipe.dart';

class RecipeCategoryView extends StatelessWidget {
  final String name, image;
  const RecipeCategoryView({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AllRecipe(recipe:name),
          ),
        );
      },
      child: SizedBox(
        width: w * 0.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,  // Add this
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: h * 0.09,
              width: w * 0.2,  // Increased width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w * 0.03),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: h * 0.01),  // Add spacing
            Text(
              name,
              style: TextStyle(
                fontSize: w * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple
              ),
              textAlign: TextAlign.center,  // Center text
              maxLines: 2,  // Limit lines
              overflow: TextOverflow.ellipsis,  // Handle overflow
            ),
          ],
        ),
      ),
    );
  }
}