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
      ingredients: reader.readString(),
      description: reader.readString(),
      imagePath: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.ingredients);
    writer.writeString(obj.description);
    writer.writeString(obj.imagePath);
  }
}
