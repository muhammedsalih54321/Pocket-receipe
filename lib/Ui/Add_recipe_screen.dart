import 'dart:io';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_recipes/Provider/Receipe_model.dart';
import 'package:pocket_recipes/Provider/Recipe_provider.dart';
import 'package:provider/provider.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  late Box<Recipe> recipeBox;

  @override
  void initState() {
    super.initState();
    recipeBox = Hive.box<Recipe>('recipes'); // Open the box
  }

  final _titleController = TextEditingController();
  final _ingredientController = TextEditingController();
  final _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;
  final List<String> _ingredients = [];

  Future<void> _getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected')),
        );
      }
    });
  }

  void _addIngredient() {
    final ingredient = _ingredientController.text.trim();
    if (ingredient.isNotEmpty && !_ingredients.contains(ingredient)) {
      setState(() {
        _ingredients.add(ingredient);
        _ingredientController.clear();
      });
    } else if (ingredient.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an ingredient!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingredient already added!')),
      );
    }
  }

  void _clearImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            BootstrapIcons.chevron_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Add Recipe',
          style: GoogleFonts.sofiaSans(
            color: Color(0xFF0A2533),
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFA8A8A9)),
                  borderRadius: BorderRadius.circular(18.r),
                  image: _image != null
                      ? DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _image == null
                    ? Center(
                        child: IconButton(
                          icon: Icon(BootstrapIcons.image, size: 80.sp),
                          onPressed: _getImage,
                        ),
                      )
                    : IconButton(
                        icon: Icon(Icons.clear, size: 30.sp),
                        onPressed: _clearImage,
                      ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Title',
                    style: GoogleFonts.sofiaSans(
                      color: Color(0xFF0A2533),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _titleController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF3F3F3),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  hintText: 'Title',
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter the title!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Ingredients',
                    style: GoogleFonts.sofiaSans(
                      color: Color(0xFF0A2533),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _ingredientController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _addIngredient,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF3F3F3),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  hintText: 'Ingredients',
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onFieldSubmitted: (value) => _addIngredient(),
              ),
              SizedBox(height: 20.h),
              ...List.generate(
                _ingredients.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Card(
                      child: ListTile(
                        title: Text(_ingredients[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _ingredients.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.sofiaSans(
                      color: Color(0xFF0A2533),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              TextFormField(
                maxLines: 5,
                minLines: 3,
                controller: _descriptionController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF3F3F3),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  hintText: 'Description',
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter the description!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () async {
                  if (_titleController.text.isEmpty ||
                      _ingredients.isEmpty ||
                      _descriptionController.text.isEmpty ||
                      _image == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text("Please fill all fields and select an image!")),
                    );
                    return;
                  }

                     final newRecipe = Recipe(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    imagePath: _image!.path, // Make sure to pass the path of the image
                    ingredients: _ingredients,
                    isFavorite: false,
                  );

                  // Add recipe to provider
                  await recipeProvider..addRecipe(newRecipe);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Recipe added successfully!")),
                  );

                  _titleController.clear();
                  _ingredientController.clear();
                  _descriptionController.clear();
                  setState(() {
                    _ingredients.clear();
                    _image = null;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: 316.w,
                  height: 57.h,
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  decoration: ShapeDecoration(
                    color: Color(0xFF6FB9BE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Create',
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
