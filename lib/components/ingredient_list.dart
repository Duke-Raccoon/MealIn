import 'package:flutter/material.dart';
import 'package:recipeapp/components/ingredient_item.dart';

class IngredientList extends StatelessWidget {
  final List<dynamic> ingredients;
  const IngredientList({super.key, required this.ingredients});

  String formatMeasure(String? measure) {
    if (measure == null || measure.isEmpty || measure == '<unit>') {
      return 'items';
    }
    return measure;
  }

  String formatQuantity(dynamic quantity) {
    if (quantity == null) return '1';
    
    double value = double.tryParse(quantity.toString()) ?? 1.0;
    if (value == 0) return '1';
    
    if (value == value.toInt()) {
      return value.toInt().toString();
    }
    
    return value.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(
        parent: NeverScrollableScrollPhysics(),
      ),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        String quantity = formatQuantity(ingredients[index]['quantity']);
        String measure = formatMeasure(ingredients[index]['measure']);

        return IngredientItem(
          quantity: quantity,
          measure: measure,
          food: ingredients[index]['food'] ?? '',
          imageUrl: ingredients[index]['image'] ?? '',
        );
      },
    );
  }
}