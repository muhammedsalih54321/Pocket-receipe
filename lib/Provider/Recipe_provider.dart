// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:pocket_recipes/Provider/Receipe_model.dart';

// class RecipeProvider with ChangeNotifier {
//   // List of recipes
//   List<Recipe> _recipes = [];
//   File? image;
//   String title = '';
//   String ingredients = '';
//   String description = '';
//   late Box<Recipe> _recipeBox; // Store the opened Hive box

//   // Getter for recipes
//   List<Recipe> get recipes => _recipes;

//   // Initialize the Hive box (call this method in the app initialization phase)
//   Future<void> initializeBox() async {
//     if (!Hive.isBoxOpen('recipes')) {
//       _recipeBox = await Hive.openBox<Recipe>('recipes');
//     } else {
//       _recipeBox = Hive.box<Recipe>('recipes');
//     }
//     await fetchRecipes(); // Load existing recipes
//   }

//   // Load recipes from Hive
//   Future<void> fetchRecipes() async {
//     try {
//       _recipes = _recipeBox.values.toList();
//       notifyListeners();
//     } catch (e) {
//       debugPrint("Error fetching recipes: $e");
//     }
//   }

//   // Save a new recipe
//   Future<void> saveRecipe() async {
//     try {
//       if (title.isEmpty || ingredients.isEmpty || description.isEmpty || image == null) {
//         throw Exception("All fields are required!");
//       }

//       final recipe = Recipe(
//         id: DateTime.now().toString(),
//         imagePath: image!.path,
//         title: title,
//         ingredients: ingredients,
//         description: description,
//       );

//       await _recipeBox.add(recipe); // Add to Hive box

//       // Update the local list
//       _recipes.add(recipe);

//       // Reset fields after saving
//       clearFields();

//       notifyListeners();
//     } catch (e) {
//       debugPrint("Error saving recipe: $e");
//     }
//   }

//   // Remove a recipe
//   Future<void> deleteRecipe(String id) async {
//     try {
//       final key = _findKeyById(id);
//       if (key != null) {
//         await _recipeBox.delete(key); // Remove from Hive box
//         _recipes.removeWhere((recipe) => recipe.id == id); // Update local list
//         notifyListeners();
//       } else {
//         debugPrint("Recipe with id $id not found!");
//       }
//     } catch (e) {
//       debugPrint("Error deleting recipe: $e");
//     }
//   }

//   // Update a recipe
//   Future<void> updateRecipe(String id, Recipe updatedRecipe) async {
//     try {
//       final key = _findKeyById(id);
//       if (key != null) {
//         await _recipeBox.put(key, updatedRecipe); // Update Hive box

//         // Update the local list
//         final index = _recipes.indexWhere((recipe) => recipe.id == id);
//         if (index != -1) {
//           _recipes[index] = updatedRecipe;
//           notifyListeners();
//         }
//       } else {
//         debugPrint("Recipe with id $id not found!");
//       }
//     } catch (e) {
//       debugPrint("Error updating recipe: $e");
//     }
//   }

//   // Helper methods to update fields
//   void setImage(File? newImage) {
//     image = newImage;
//     notifyListeners();
//   }

//   void setTitle(String newTitle) {
//     title = newTitle;
//     notifyListeners();
//   }

//   void setIngredients(String newIngredients) {
//     ingredients = newIngredients;
//     notifyListeners();
//   }

//   void setDescription(String newDescription) {
//     description = newDescription;
//     notifyListeners();
//   }

//   void clearFields() {
//     image = null;
//     title = '';
//     ingredients = '';
//     description = '';
//     notifyListeners();
//   }

//   // Helper method to find a Hive key by recipe id
//   dynamic _findKeyById(String id) {
//     return _recipeBox.keys.firstWhere(
//       (key) {
//         final recipe = _recipeBox.get(key);
//         return recipe?.id == id;
//       },
//       orElse: () => null,
//     );
//   }
// }
