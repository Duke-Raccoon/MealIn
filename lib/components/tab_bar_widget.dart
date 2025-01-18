import 'package:flutter/material.dart';
import 'package:recipeapp/components/constant_function.dart';
import 'package:recipeapp/screens/recipe_detail.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: h * 0.04,
            child: TabBar(
              labelStyle: const TextStyle(
                
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: Colors.purple,
              labelColor: Colors.deepPurple,
              dividerColor: Colors.white,
              indicator: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20)),
              labelPadding: EdgeInsets.symmetric(horizontal: w * 0.001),
              tabs: const [
                TabItem(title: 'Breakfast'),
                TabItem(title: 'Lunch'),
                TabItem(title: 'Dinner'),
                TabItem(title: 'Dessert'),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.03,
          ),
          SizedBox(
            height: h * 0.3,
            child: const TabBarView(
              children: [
                HomeTabBarView(recipe: 'breakfast'),
                HomeTabBarView(recipe: 'lunch'),
                HomeTabBarView(recipe: 'dinner'),
                HomeTabBarView(recipe: 'dessert'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  const TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.deepOrange,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class HomeTabBarView extends StatelessWidget {
  final String recipe;
  const HomeTabBarView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: ConstantFunction.getResponse(recipe),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData) {
          return  const Center(
            child: Text('No Data'),
          );
        }
        return SizedBox(
          height: h * 0.3,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Map<String, dynamic> snap = snapshot.data![index];
                int time = snap['totalTime'].toInt();
                int calories = snap['calories'].toInt();
                return Container(
                  margin: EdgeInsets.only(right: w * 0.02),
                  width: w * 0.5,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetail(recipe: snap)));
                        
                        },
                        
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: w,
                            height: h * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(snap['image']),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            snap['label'],
                            style: TextStyle(
                                fontSize: w * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                'calories ${calories.toString()} . ${time.toString()} min',
                                style: TextStyle(
                                  fontSize: w * 0.04,
                                  color: Colors.grey
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 15,
                );
              },
              itemCount: snapshot.data!.length
              ),
        );
      
      }, 
    );
    
  }
}
