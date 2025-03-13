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
  final List<dynamic> Quantity;

  const RecipeDetailsScreen({
    Key? key,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.description,
     required this.Quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final isFavorite = recipeProvider.favorites
        .any((recipe) => recipe.title == title); // Check favorite status

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          // Fixed Image at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(image)),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),

          // Scrollable Content
          NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
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
                                Quantity: Quantity,
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
                    ),
                    SizedBox(height: 180.h),
                    // Creates space for the fixed image
                    Container(
                      width: double.infinity.w,
                 
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                        
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              title,
                              style: GoogleFonts.poppins(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 20.h),

                            // Ingredients List
                            Text(
                              "Ingredients",
                              style: GoogleFonts.poppins(
                                  fontSize: 17.sp, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10.h),
                            ...List.generate(
                              ingredients.length,
                              (index) {
                                return Row(
                                  children: [
                                    Icon(Icons.check_circle,
                                        color: Colors.green, size: 18.sp),
                                    SizedBox(width: 10.w),
                                    Text("${ingredients[index]} - ${Quantity[index]}",
                                        style: TextStyle(fontSize: 16.sp)),
                                  ],
                                );
                              },
                            ),

                            SizedBox(height: 20.h),

                            // Ingredients List
                            Text(
                              "Instructions",
                              style: GoogleFonts.poppins(
                                  fontSize: 17.sp, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              description,
                              style: GoogleFonts.sofiaSans(
                                fontSize: 16.sp,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            GestureDetector(
                              onTap: () {
                                recipeProvider.removeRecipe(title);
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Delete",
                                    style: GoogleFonts.poppins(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        recipeProvider.removeRecipe(title);
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        BootstrapIcons.trash3,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            )
                          ]),

                      // Close Button
                    )
                  ],
                ),
              ))
        ]));
  }
}
