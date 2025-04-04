import 'package:flutter/material.dart';
import 'package:recipes/model/recipe_model.dart';
import 'package:recipes/view/widgets/text_item.dart';

class DetailsMainCardWidget extends StatelessWidget {
  const DetailsMainCardWidget({super.key, required this.recipeModel});

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextItem(text: recipeModel.name),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${recipeModel.caloriesPerServing} CAL"),
              Text(recipeModel.difficulty),
              Text(recipeModel.cuisine),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Row(
                children: List.generate(
                  5,
                  (i) => Icon(color: Colors.yellow, Icons.star),
                ),
              ),
              Text("${recipeModel.rating}"),
              Text("(${recipeModel.reviewCount})"),
            ],
          ),
        ],
      ),
    );
  }
}
