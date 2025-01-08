import 'dart:io';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_recipes/Provider/Recipe_provider.dart';
import 'package:pocket_recipes/Ui/Recipe_details_screen.dart';
import 'package:provider/provider.dart';

class FavouratePage extends StatelessWidget {
  const FavouratePage({super.key});

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
          'My Favorite',
          style: GoogleFonts.sofiaSans(
            color: const Color(0xFF0A2533),
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Consumer<RecipeProvider>(
          builder: (context, recipeProvider, _) {
            final favoriteRecipes = recipeProvider.favorites;

            if (favoriteRecipes.isEmpty) {
              return Center(
                child: Text(
                  'No favorite recipes yet!',
                  style: GoogleFonts.sofiaSans(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              );
            }

            return GridView.builder(
              itemCount: favoriteRecipes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 340 / 400,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => RecipeDetailsScreen(
                                title: recipe.title,
                                image: recipe.imagePath,
                                ingredients: recipe.ingredients,
                                description: recipe.description)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 156.w,
                    height: 198.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1, color: const Color(0xFFFAFAFA)),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      shadows: [
                        BoxShadow(
                          color: const Color(0x19053336),
                          blurRadius: 16.r,
                          offset: const Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          width: 132.w,
                          height: 88.h,
                          decoration: ShapeDecoration(
                            image: recipe.imagePath.isNotEmpty
                                ? DecorationImage(
                                    image: FileImage(File(recipe.imagePath)),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            color: const Color(0xFFC4C4C4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 28.w,
                              height: 28.h,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: const Color(0x19053336),
                                    blurRadius: 16.r,
                                    offset: const Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  BootstrapIcons.heart_fill,
                                  color: const Color(0xFF6FB9BE),
                                  size: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                          width: 132.w,
                          child: Text(
                            recipe.title,
                            style: GoogleFonts.sofiaSans(
                              color: const Color(0xFF0A2533),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.35.h,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 0.3,
                        ),
                        GestureDetector(
                            onTap: () {
                            recipeProvider.removeFromFavorites(recipe.title);
                            },
                            child: Icon(
                              BootstrapIcons.trash3,
                              size: 20,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
