import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IngredientItem extends StatelessWidget {
  final String quantity, measure, food, imageUrl;
  const IngredientItem(
      {super.key,
      required this.quantity,
      required this.measure,
      required this.food,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.03),
      padding: EdgeInsets.only(
          top: h * 0.01, bottom: h * 0.01, left: w * 0.02, right: w * 0.03),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.4), // Pink shadow for glow effect
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              height: h * 0.1,
              width: w * 0.2,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            '$food\n$quantity $measure',
            style: TextStyle(
                fontSize: w * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          ValueListenableBuilder(
            valueListenable: Hive.box('shopping').listenable(),
            builder: (context, box, _) {
              bool isAdded = box.containsKey(food);
              if (isAdded) {
                return GestureDetector(
                    onTap: () {
                      box.delete(food);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.deepOrange,
                        content: Text(
                          'Removed $food from shopping list',
                          style: TextStyle(fontSize: h * 0.02),
                        ),
                        duration: const Duration(seconds: 1),
                      ));
                    },
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ));
              } else {
                return GestureDetector(
                    onTap: () {
                      box.put(food, '$food, $quantity $measure ');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.deepOrangeAccent,
                        content: Text(
                          'Added $food to shopping list',
                          style: TextStyle(fontSize: h * 0.02),
                        ),
                        duration: const Duration(seconds: 1),
                      ));
                    },
                    child: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ));
              }
            },
          )
        ],
      ),
    );
  }
}
