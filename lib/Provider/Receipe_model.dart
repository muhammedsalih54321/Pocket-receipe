import 'package:hive/hive.dart';
// Required for code generation

@HiveType(typeId: 0) // Assign a unique typeId for this model
class Recipe {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final List ingredients;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String imagePath;

  Recipe({
    required this.title,
    required this.ingredients,
    required this.description,
    required this.imagePath,
  });
}
