import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pocket_recipes/Provider/Receipe_model.dart';

class RecipeProvider extends ChangeNotifier {
  late Box<Recipe> recipeBox;

  // Holds the filtered recipes
  List<Recipe> _filteredRecipes = [];

  // Get all recipes
  List<Recipe> get recipes => recipeBox.values.toList();

  // Get favorite recipes
  List<Recipe> get favorites =>
      recipes.where((recipe) => recipe.isFavorite).toList();

  // Get filtered recipes
  List<Recipe> get filteredRecipes => _filteredRecipes.isEmpty
      ? recipes // If no filter is applied, return all recipes
      : _filteredRecipes;

  // Initialize the box in initState
  Future<void> init() async {
    recipeBox = await Hive.openBox<Recipe>('recipes');
    notifyListeners();
  }

  // Add a new recipe
  void addRecipe(Recipe recipe) {
    recipeBox.put(recipe.title, recipe);
    notifyListeners();
  }

  // Toggle favorite status
 void toggleFavorite({
  required String title,
  required String description,
  required String imagePath,
  required List<dynamic> ingredients,
}) {
  final existingRecipe = recipeBox.get(title);

  if (existingRecipe != null) {
    // Toggle the favorite status (set isFavorite to false if true, and vice versa)
    existingRecipe.isFavorite = !existingRecipe.isFavorite;
    recipeBox.put(title, existingRecipe);  // Update the recipe in the box
  } else {
    // Add the recipe as a favorite if it doesn't exist
    final newRecipe = Recipe(
      title: title,
      description: description,
      imagePath: imagePath,
      ingredients: ingredients,
      isFavorite: true, // Add as favorite initially
    );
    recipeBox.put(title, newRecipe); // Save the new favorite recipe
  }

  // Notify listeners to update the UI
  notifyListeners();
}

  // Remove a recipe
  void removeRecipe(String title) {
    recipeBox.delete(title);
    notifyListeners();
  }

  // Filter recipes based on a search query
  void filterRecipes(String query) {
    if (query.isEmpty) {
      _filteredRecipes = [];
    } else {
      _filteredRecipes = recipes
          .where((recipe) => recipe.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
