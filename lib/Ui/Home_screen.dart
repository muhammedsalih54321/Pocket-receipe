import 'dart:io';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_recipes/Provider/Recipe_provider.dart';
import 'package:pocket_recipes/Ui/Add_recipe_screen.dart';
import 'package:pocket_recipes/Ui/Recipe_details_screen.dart';
import 'package:pocket_recipes/Ui/favourate_page.dart';
import 'package:provider/provider.dart';
bool fileExists(String path) {
  return File(path).existsSync();
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchRecipes);
  }

  void _searchRecipes() {
    final query = _searchController.text.toLowerCase();
    Provider.of<RecipeProvider>(context, listen: false).filterRecipes(query);
  }

  @override
  void dispose() {
    _searchController.removeListener(_searchRecipes);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Text(
          'Pocket Recipes',
          textAlign: TextAlign.left,
          style: GoogleFonts.sofiaSans(
            color: const Color.fromRGBO(10, 37, 51, 1),
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FavouratePage()),
                );
              },
              child: const Icon(
                BootstrapIcons.heart,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 327.w,
                height: 54.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        BorderSide(width: 2.w, color: const Color(0xFFE6EBF2)),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: TextFormField(
                  style: GoogleFonts.sofiaSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      BootstrapIcons.search,
                      size: 20.sp,
                    ),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.sofiaSans(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF97A1B0),
                    ),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Consumer<RecipeProvider>(
                builder: (context, recipeProvider, _) {
                  final filteredRecipes = recipeProvider.filteredRecipes;

                  if (filteredRecipes.isEmpty) {
                    return Center(
                      child: Text(
                        'No Recipes Found',
                        style: GoogleFonts.sofiaSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = filteredRecipes[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                             MaterialPageRoute(builder: (_)=> RecipeDetailsScreen(
                                  title: recipe.title,
                                  image: recipe.imagePath,
                                   ingredients: recipe.ingredients,
                                  description: recipe.Instructions,
                                ),)
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFFAFAFA)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x19053336),
                                  blurRadius: 16,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 84.h,
                                  decoration: ShapeDecoration(
                                    image: fileExists(recipe.imagePath)
                                        ? DecorationImage(
                                            image: FileImage(
                                                File(recipe.imagePath)),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                    color: const Color(0xFF88C3C6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Text(
                                    recipe.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.sofiaSans(
                                      color: const Color(0xFF0A2533),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                GestureDetector(onTap: () {
                                   recipeProvider.removeRecipe(recipe.title);
                                },
                                  child: Container(
                                    width: 24.w,
                                    height: 24.h,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF032628),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        BootstrapIcons.arrow_right,
                                        color: Colors.white,
                                        size: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_)=>AddRecipeScreen())
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: const Color(0xFF6FB9BE),
      ),
    );
  }
}
