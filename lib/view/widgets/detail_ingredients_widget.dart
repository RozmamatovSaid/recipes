import 'package:flutter/material.dart';
import 'package:recipes/model/recipe_model.dart';
import 'package:recipes/view/widgets/text_item.dart';

class DetailIngredientsWidget extends StatelessWidget {
  const DetailIngredientsWidget({super.key, required this.recipes});

  final RecipeModel recipes;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),

        TextItem(text: "Ingredients"),
        ...recipes.ingredients.map(
          (e) =>
              Text("• $e", style: TextStyle(color: Colors.black, fontSize: 16)),
        ),
        SizedBox(height: 10),
        Divider(height: 4, color: Colors.grey.withValues(alpha: 0.4)),
        SizedBox(height: 10),
      ],
    );
  }
}
