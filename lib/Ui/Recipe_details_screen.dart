import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_recipes/Provider/Recipe_provider.dart';
import 'package:provider/provider.dart';

class RecipeDetailsScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final isFavorite = recipeProvider.favorites
        .any((recipe) => recipe.title == title); // Check favorite status

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
                    image: FileImage(File(image)),
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
                          onTap: () {
                            recipeProvider.toggleFavorite(
                              Instructions: description,
                              imagePath: image,
                              ingredients: ingredients, 
                              title: title,
                            );
                          },
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
                              isFavorite
                                  ? BootstrapIcons.heart_fill
                                  : BootstrapIcons.heart,
                              color: isFavorite
                                  ? const Color(0xFF6FB9BE)
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                title,
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
                children: ingredients.map((ingredient) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6EBF2),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      ingredient,
                      style: GoogleFonts.mulish(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.h),
              Text(
                description,
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
