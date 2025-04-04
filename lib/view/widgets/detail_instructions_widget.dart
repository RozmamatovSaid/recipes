import 'package:flutter/material.dart';
import 'package:recipes/model/recipe_model.dart';

import 'text_item.dart';

class DetailInstructionsWidget extends StatefulWidget {
  const DetailInstructionsWidget({super.key, required this.recipeModel});

  final RecipeModel recipeModel;

  @override
  State<DetailInstructionsWidget> createState() =>
      _DetailInstructionsWidgetState();
}

class _DetailInstructionsWidgetState extends State<DetailInstructionsWidget> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 10),
        TextItem(text: "Instructions"),
        ...widget.recipeModel.instructions.map(
          (e) => Text(
            "${count++}. $e",
            maxLines: 1,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        SizedBox(height: 10),

        Divider(height: 4, color: Colors.grey.withValues(alpha: 0.4)),
        SizedBox(height: 10),
      ],
    );
  }
}
