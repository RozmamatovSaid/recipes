import 'package:flutter/material.dart';
import 'package:recipes/controller/recipe_controller.dart';
import 'package:recipes/model/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.image,
    required this.name,
    required this.cal,
    required this.level,
    required this.location,
    required this.rating,
    required this.reviewCount,
    required this.onTap,
  });

  final String image;
  final String name;
  final int cal;
  final String level, location;
  final double rating;
  final int reviewCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  width: 80,
                  height: 80,
                  alignment: Alignment.centerLeft,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${cal} CAL"),
                        Text(level),
                        Text("$reviewCount"),
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
                        Text("$rating"),
                        Text("($reviewCount)"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(height: 5, color: Colors.grey.withValues(alpha: 0.5)),
        ],
      ),
    );
  }
}
