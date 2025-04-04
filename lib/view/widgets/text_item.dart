import 'package:flutter/material.dart';
import 'package:recipes/model/recipe_model.dart';

class TextItem extends StatelessWidget {
  const TextItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
