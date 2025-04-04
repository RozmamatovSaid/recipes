import 'package:flutter/material.dart';
import 'package:recipes/controller/recipe_controller.dart';
import 'package:recipes/model/recipe_model.dart';
import 'package:recipes/view/screens/recipe_detail_screen.dart';
import 'package:recipes/view/widgets/recipe_card.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<RecipeModel> recipes = [];
  bool isLoading = true;

  void loadRecipes() async {
    final recipe = await RecipeController().getRecipes();
    setState(() {
      recipes = recipe;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadRecipes();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recipes",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: TextField(decoration: InputDecoration()),
        ),
      ),
      body:
          isLoading == true
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: recipes.length,
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemBuilder:
                    (context, index) => RecipeCard(
                      image: recipes[index].image,
                      name: recipes[index].name,
                      cal: recipes[index].caloriesPerServing,
                      level: recipes[index].difficulty,
                      location: recipes[index].cuisine,
                      rating: recipes[index].rating,
                      reviewCount: recipes[index].reviewCount,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    RecipeDetailScreen(recipes: recipes[index]),
                          ),
                        );
                      },
                    ),
              ),
    );
  }
}
