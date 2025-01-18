import 'package:flutter/material.dart';
import 'package:recipeapp/components/constant_function.dart';
import 'package:recipeapp/components/custom_app_bar.dart';
import 'package:recipeapp/screens/recipe_detail.dart';

class AllRecipe extends StatelessWidget {
  final String recipe;
  const AllRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: recipe, back: true),
      body: FutureBuilder(
          future: ConstantFunction.getResponse(recipe),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());

            
            } else if (!snapshot.hasData) {
              return const Center(
                child: (Text('no data')),
              );
            }
            return Padding(
              padding: EdgeInsets.only(right: w * 0.03, left: w * 0.03),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 10,
                    childAspectRatio: .6 / 1),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No recipes found'));
                  }

                  Map<String, dynamic> snap = snapshot.data![index];
                  int time = snap['totalTime']?.toInt() ?? 0;

                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => RecipeDetail(recipe: snap),));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(snap['image']),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Container(
                                    height: 20,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${time.toInt()} min', // Fix toString() call
                                        style: const TextStyle(
                                          color: Colors
                                              .white, // Changed to white for better contrast
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Expanded(
                            child: Text(
                          snap['label'],
                          style: const TextStyle(color: Colors.black),
                        )),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
