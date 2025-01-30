import 'package:flutter/material.dart';
import 'package:recipeapp/screens/all_recipe.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final h= MediaQuery.of(context).size.height;
    final w= MediaQuery.of(context).size.width;
    return Container( 
      height: h*0.045,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.4), // Pink shadow for glow effect
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
          
        ]
      ),
    
      child: TextField(
        controller: searchController,
        style: TextStyle(
          fontSize: w*0.03,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'what\'s your food thoughts today?',
          hintStyle: TextStyle(
            fontSize: w*0.03,
            color: Colors.deepOrangeAccent,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: w*0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> AllRecipe(recipe: searchController.text)));
            },
            child:  Icon(Icons.search, 
            color: Colors.pinkAccent,
            size: w*0.06,
              
            ),
        )
        ),
      ),);
  }
}