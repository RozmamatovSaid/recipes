import 'package:flutter/material.dart';
import 'package:recipes/model/recipe_model.dart';
import 'package:recipes/view/widgets/detail_instructions_widget.dart';
import 'package:recipes/view/widgets/detail_item.dart';
import 'package:recipes/view/widgets/detail_ingredients_widget.dart';
import 'package:recipes/view/widgets/details_main_card_widget.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipeModel recipes;

  const RecipeDetailScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          Image.network(
            recipes.image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: ListView(
                children: [
                  DetailsMainCardWidget(recipeModel: recipes),
                  Divider(height: 4, color: Colors.grey.withValues(alpha: 0.4)),
                  SizedBox(height: 20),
                  DetailIngredientsWidget(recipes: recipes),
                  DetailInstructionsWidget(recipeModel: recipes),
                  DetailItems(
                    title: "Prep Time",
                    subtitle: "${recipes.prepTimeMinutes} minutes",
                  ),
                  DetailItems(
                    title: "Cook Time",
                    subtitle: "${recipes.cookTimeMinutes} minutes",
                  ),
                  DetailItems(
                    title: "Servings",
                    subtitle: "${recipes.servings}",
                  ),
                  DetailItems(
                    title: "Difficulty",
                    subtitle: recipes.difficulty,
                  ),
                  DetailItems(title: "Cuisine", subtitle: recipes.cuisine),
                  DetailItems(title: "Tags", subtitle: "${recipes.tags}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
