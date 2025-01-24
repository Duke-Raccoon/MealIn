import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapp/components/circle_button.dart';
import 'package:recipeapp/components/custom_clipper.dart';
import 'package:recipeapp/components/ingredient_list.dart';
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
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for sticky back button
          SliverAppBar(
            expandedHeight: h * 0.4,
            floating: false, // Make sure the app bar doesn't disappear
            pinned: true, // Keeps the AppBar pinned at the top
            backgroundColor: Colors.deepOrange,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: h * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(recipeInfo['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          // Content of the recipe detail screen
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: h * 0.01),
                      Text(
                        recipeInfo['label'],
                        style: TextStyle(
                          fontSize: w * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: h * 0.001),
                      Text(
                        "$time min",
                        style: TextStyle(fontSize: w * 0.04, color: Colors.grey),
                      ),
                      SizedBox(height: h * 0.01),
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
                              bool saved =
                              Hive.box('saved').containsKey(recipeInfo['label']);
                              if (saved) {
                                return GestureDetector(
                                  onTap: () {
                                    Hive.box('saved').delete(recipeInfo['label']);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.deepOrange,
                                        content: Text('Removed from saved recipes'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  child: const CircleButton(
                                    icon: Icons.bookmark,
                                    label: 'Saved',
                                  ),
                                );
                              } else {
                                return GestureDetector(
                                  onTap: () {
                                    Hive.box('saved').put(recipeInfo['label'], recipeInfo['label']);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.deepOrange,
                                        content: Text('Added to saved recipes'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  child: const CircleButton(
                                    icon: Icons.bookmark_border,
                                    label: 'Save',
                                  ),
                                );
                              }
                            },
                          ),
                          const CircleButton(
                            icon: Icons.monitor_heart_outlined,
                            label: 'Calories',
                          ),
                          const CircleButton(
                            icon: Icons.table_chart_outlined,
                            label: 'unit chart',
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Let's start cooking",
                            style: TextStyle(
                                fontSize: w * 0.05, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: w * 0.36,
                            child: ElevatedButton(
                              onPressed: () {
                                StartRecipe.startRecipe(recipeInfo['url']);
                              },
                              child: const Text('Start'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.02),
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
                          ingredients: recipeInfo['ingredients'],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
