import 'package:flutter/material.dart';
import 'package:recipeapp/components/custom_app_bar.dart';
import 'package:recipeapp/constants/serach_tags.dart';
import 'package:recipeapp/components/text_field_widget.dart';
import 'package:recipeapp/screens/all_recipe.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Search',
        back: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextFieldWidget(),
            SizedBox(height: h * 0.03),
            Text(
              'Search Tags',
              style: TextStyle(
                fontSize: w * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent
              ),
            ),
            Wrap(spacing: 8,
            children: 
              tags.map((label){
                return ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllRecipe(recipe: label)));
                }, 
                child: Text(label)
                );
              }).toList()
            
            ,)
          ],
        ),
      ),
    );
  }
}
