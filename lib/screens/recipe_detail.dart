import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapp/components/circle_button.dart';
import 'package:recipeapp/components/custom_clipper.dart';

import 'package:recipeapp/components/ingredient_list.dart';
import 'package:recipeapp/constants/detail_calories.dart';
import 'package:recipeapp/constants/share.dart';
import 'package:recipeapp/constants/start_recipe.dart';

class RecipeDetail extends StatelessWidget {
  final Map<String, dynamic> recipeInfo;

  const RecipeDetail({super.key, required this.recipeInfo});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var ingredientCount = recipeInfo['ingredients'].length;
    String time = recipeInfo['totalTime'].toString();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  
                  height: h * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink
                            .withOpacity(0.4), // Pink shadow for glow effect
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],

                    image: DecorationImage(
                      image: NetworkImage(recipeInfo['image']),
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
                        backgroundColor: Colors.pinkAccent,
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
                    recipeInfo['label'],
                    style: TextStyle(
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  ),
                  SizedBox(
                    height: h * 0.001,
                  ),
                  Text(
                    "$time min",
                    style: TextStyle(
                        fontSize: w * 0.04, color: Colors.deepPurpleAccent),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ShareRecipe.share(recipeInfo['url']);
                        },
                        child: const CircleButton(
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: Hive.box('saved').listenable(),
                        builder: (context, box, _) {
                          bool saved = Hive.box('saved')
                              .containsKey(recipeInfo['label']);
                          if (saved) {
                            return GestureDetector(
                                onTap: () {
                                  Hive.box('saved').delete(
                                    recipeInfo['label'],
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    backgroundColor: Colors.deepOrangeAccent,
                                    content: Text('Removed from saved recipes'),
                                    duration: Duration(seconds: 1),
                                  ));
                                },
                                child: const CircleButton(
                                  icon: Icons.bookmark,
                                  label: 'Saved',
                                ));
                          } else {
                            return GestureDetector(
                                onTap: () {
                                  Hive.box('saved').put(
                                      recipeInfo['label'], recipeInfo['label']);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    backgroundColor: Colors.deepOrangeAccent,
                                    content: Text('Added to saved recipes'),
                                    duration: Duration(seconds: 1),
                                  ));
                                },
                                child: const CircleButton(
                                  icon: Icons.bookmark_border,
                                  label: 'Save',
                                ));
                          }
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          ShowDialog.showCalories(
                              recipeInfo['totalNutrients'], context);
                        },
                        child: const CircleButton(
                          icon: Icons.monitor_heart_outlined,
                          label: 'Calories',
                        ),
                      ),
                      const CircleButton(
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
                        "Let's start cooking",
                        style: TextStyle(
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent),
                      ),
                      SizedBox(
                        width: w * 0.36,
                        
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            
                          ),
                          
                            onPressed: () {
                              StartRecipe.startRecipe(recipeInfo['url']);
                            },
                            child: const Text('Start', style: TextStyle(color: Colors.white),)),
                            
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
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.pinkAccent,
                                    Colors.deepOrangeAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink.withOpacity(
                                        0.4), // Pink shadow for glow effect
                                    blurRadius: 15,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
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
                                  color: Colors.deepPurpleAccent
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
                      ingredients: recipeInfo['ingredients'],
                      
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
