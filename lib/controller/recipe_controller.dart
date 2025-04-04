import 'dart:convert';
import 'package:recipes/model/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeController {
  Future<List<RecipeModel>> getRecipes() async {
    final url = Uri.parse("https://dummyjson.com/recipes");
    final response = await http.get(url);
    final deCode = jsonDecode(response.body);
    final List<RecipeModel> recipes = [];
    for(var recipe in deCode['recipes']){
      recipes.add(RecipeModel.fromJson(recipe));
    }
    return recipes;
  }
}
