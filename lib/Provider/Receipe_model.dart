import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String Instructions;

  @HiveField(2)
  final String imagePath;

  @HiveField(3)
  final List<dynamic> ingredients;

  // Ensure that `isFavorite` is initialized properly
  @HiveField(4)
  bool isFavorite;

  @HiveField(5)
  final List<dynamic> Quantity;

  Recipe( {
    required this.Quantity,
    required this.title,
    required this.Instructions,
    required this.imagePath,
    required this.ingredients,
    this.isFavorite = false, // Provide a default value for `isFavorite`
  });
}
