// GENERATED CODE - DO NOT MODIFY BY HAND



// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

import 'package:hive_flutter/hive_flutter.dart';

import 'Receipe_model.dart';
// Links the generated file




class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    return Recipe(
      title: reader.readString(),
      ingredients: (reader.readList()).cast<String>(), // Ensure List<String>
      description: reader.readString(),
      imagePath: reader.readString(),
      isFavorite: reader.readBool(), // Read the isFavorite field
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer.writeString(obj.title);
    writer.writeList(obj.ingredients); // Write List<String>
    writer.writeString(obj.description);
    writer.writeString(obj.imagePath);
    writer.writeBool(obj.isFavorite); // Write the isFavorite field
  }
}
