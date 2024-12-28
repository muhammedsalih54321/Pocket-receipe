import 'dart:io';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_recipes/Provider/Receipe_model.dart';

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
    recipeBox = Hive.box<Recipe>(
        'recipes'); // Open the box (it's already opened in main.dart)
  }

  final Title = TextEditingController();
  final incrediant = TextEditingController();
  final description = TextEditingController();
  final Picker = ImagePicker();
  File? image;

  Future<void> getimage() async {
    final PickedFile =
        await Picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (PickedFile != null) {
        image = File(PickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  final List<String> _ingredients = [];

  void _addIngredient() {
    if (incrediant.text.trim().isNotEmpty) {
      setState(() {
        _ingredients.add(incrediant.text.trim());
        incrediant.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          'Add reciepe',
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
                  image: image != null
                      ? DecorationImage(
                          image: FileImage(image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: image == null
                    ? GestureDetector(
                        onTap: getimage,
                        child: Center(
                          child: Icon(
                            BootstrapIcons.image,
                            size: 80.sp,
                          ),
                        ),
                      )
                    : null,
              ),
              SizedBox(
                height: 20.h,
              ),
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
                controller: Title,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF3F3F3),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r)),
                  hintText: 'Title  ',
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
                validator: (Title) {
                  if (Title!.isEmpty) {
                    return 'Enter the title!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text(
                    'Incriedient',
                    style: GoogleFonts.sofiaSans(
                      color: Color(0xFF0A2533),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: incrediant,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _addIngredient,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF3F3F3),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r)),
                  hintText: 'Incriedients  ',
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
                onFieldSubmitted: (value) => _addIngredient(),
                validator: (Incriedient) {
                  if (Incriedient!.isEmpty) {
                    return 'Enter the Incriedients!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              ...List.generate(
                _ingredients.length,
                (index) {
                  return  Padding(
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
              SizedBox(
                height: 20.h,
              ),
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
                maxLines: 50,
                minLines: 10,
                controller: description,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF3F3F3),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: Color(0xFFA8A8A9)),
                      borderRadius: BorderRadius.circular(10.r)),
                  hintText: 'Description  ',
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
                validator: (Description) {
                  if (Description!.isEmpty) {
                    return 'Enter the Description!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () async {
                  if (Title.text.isEmpty ||
                      _ingredients.isEmpty ||
                      description.text.isEmpty ||
                      image == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              "Please fill all fields and select an image!")),
                    );
                    return;
                  }

                  // Save to Hive
                  final recipe = Recipe(
                    title: Title.text,
                    ingredients: _ingredients,
                    description: description.text,
                    imagePath: image!.path,
                  );

                  await recipeBox.add(recipe);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Recipe added successfully!")),
                  );

                  // Clear fields and image
                  setState(() {
                    Title.clear();
                    incrediant.clear();
                    description.clear();
                    image = null;
                    Navigator.pop(context);
                  });
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Text(
                            'Create',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: 0.36,
                            ),
                          )
                        ]))),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
