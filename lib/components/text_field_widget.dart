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
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0.5,
            offset: Offset(0, 1.5), 
            // changes position of shadow
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
            color: Colors.grey,
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
            color: Colors.deepOrange,
            size: w*0.06,
              
            ),
        )
        ),
      ),);
  }
}