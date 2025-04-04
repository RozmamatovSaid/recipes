import 'package:flutter/material.dart';
import 'package:recipes/model/recipe_model.dart';
import 'package:recipes/view/widgets/text_item.dart';

class DetailItems extends StatelessWidget {
  const DetailItems({super.key, required this.title, required this.subtitle});

  final String title,subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextItem(text: title),
        Text(
          subtitle,
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        Divider(height: 4, color: Colors.grey.withValues(alpha: 0.4)),
        SizedBox(height: 20),
      ],
    );
  }
}
