import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final String title;
  final String image;
  final List<dynamic> ingredients;
  final String description;

  const RecipeDetailsScreen({
    Key? key,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.description,
  }) : super(key: key);

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  late Box<Map<String, dynamic>> favoriteBox;
  bool isFavorite = false;

 @override
void initState() {
  super.initState();

  // Access the already opened box
  favoriteBox = Hive.box<Map<String, dynamic>>('favorite');
  isFavorite = favoriteBox.containsKey(widget.title);
}


  void checkIfFavorite() {
    setState(() {
      isFavorite = favoriteBox.containsKey(widget.title);
    });
  }

 void toggleFavorite() {
  if (isFavorite) {
    // Remove from favorites
    favoriteBox.delete(widget.title);
  } else {
    // Add to favorites with proper type
    favoriteBox.put(widget.title, {
      'title': widget.title,
      'image': widget.image,
      'ingredients': widget.ingredients,
      'description': widget.description,
    });
  }
  setState(() {
    isFavorite = !isFavorite;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                height: 230.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(widget.image)),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6.r,
                                ),
                              ],
                            ),
                            child: Icon(
                              BootstrapIcons.x_lg,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: toggleFavorite,
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6.r,
                                ),
                              ],
                            ),
                            child:isFavorite ? Icon(
                              BootstrapIcons.heart_fill,
                              color:Color(0xFF6FB9BE),
                            ):Icon(
                              BootstrapIcons.heart,
                              color:Colors.black87,
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                widget.title,
                style: GoogleFonts.sofiaSans(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 5.w,
                runSpacing: 10.h,
                children: widget.ingredients.map((ingredient) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      ingredient,
                      style: GoogleFonts.mulish(
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.h),
              Text(
                widget.description,
                style: GoogleFonts.sofiaSans(
                  fontSize: 16.sp,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
