import 'package:flutter/material.dart';
import 'package:recipeapp/components/circle_button.dart';
import 'package:recipeapp/components/custom_clipper.dart';

import 'package:recipeapp/components/ingredient_list.dart';


class RecipeDetail extends StatelessWidget {
  final Map<String, dynamic> recipe;
  
  const RecipeDetail({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var ingredientCount = recipe['ingredients'].length;
    String time = recipe['totalTime'].toString();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(recipe['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Text(
                    recipe['label'],
                    style: TextStyle(
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: h * 0.001,
                  ),
                  Text(
                    "$time min",
                    style: TextStyle(fontSize: w * 0.04, color: Colors.grey),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleButton(
                        icon: Icons.share,
                        label: 'Share',
                      ),
                      CircleButton(
                        icon: Icons.bookmark_border,
                        label: 'Save',
                      ),
                      CircleButton(
                        icon: Icons.monitor_heart_outlined,
                        label: 'Calories',
                      ),
                      CircleButton(
                        icon: Icons.table_chart_outlined,
                        label: 'unit chart',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Direction",
                        style: TextStyle(
                            fontSize: w * 0.05, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: w * 0.36,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('Start')),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    height: h * 0.07,
                    width: w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipPath(
                            clipper: CustomClipperPath(),
                            child: Container(
                              color: Colors.deepOrange,
                              child: Center(
                                child: Text(
                                  'List of ingredients',
                                  style: TextStyle(
                                      fontSize: w * 0.05, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                '   $ingredientCount\nItems',
                                style: TextStyle(
                                  fontSize: w * 0.04,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 2,
                    child: IngredientList(
                      ingredients: recipe['ingredients'],
                    ),
                  ),
                 
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
