import 'package:flutter/material.dart';
import 'package:recipeapp/components/recipe_category.dart';
import 'package:recipeapp/constants/category_list.dart';
import 'package:recipeapp/constants/images_path.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: EdgeInsets.all(w * 0.003),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.05,
              ),
              Text(
                'For You',
                style:
                    TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h*0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RecipeCategoryView(name:name[0], image:image[0]),
                    RecipeCategoryView(name:name[1], image:image[1]),
                    RecipeCategoryView(name:name[2], image:image[2]),
                    RecipeCategoryView(name:name[3], image:image[3]),
                ],),
                
              ),
              Text(
                'Tasty',
                style:
                    TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h*0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RecipeCategoryView(name:category[0], image:picture[0]),
                    RecipeCategoryView(name:category[1], image:picture[1]),
                    RecipeCategoryView(name:category[2], image:picture[2]),
                    RecipeCategoryView(name:category[3], image:picture[3]),
                    
                    
                ],),
              ),
              Text(
                'Any time of day',
                style:
                    TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h*0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RecipeCategoryView(name:category[4], image:picture[4]),
                    RecipeCategoryView(name:category[5], image:picture[5]),
                    RecipeCategoryView(name:category[6], image:picture[6]),
                    //RecipeCategoryView(name:category[6], image:picture[6]),
                    
                ],),
                
              ),
              Container(
                height: h * 0.25,
                width: w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImagesPath.explore), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)
                ),
              ),
              
            ],
          ),
        ));
  }
}
