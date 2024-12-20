import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_recipes/Ui/Add_recipe_screen.dart';
import 'package:pocket_recipes/Ui/Recipe_details_screen.dart';
import 'package:pocket_recipes/Ui/favourate_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Text(
          'Pocket Recipes ',
          textAlign: TextAlign.left,
          style: GoogleFonts.sofiaSans(
            color: Color.fromRGBO(10, 37, 51, 1),
            fontSize: 24.sp,
            letterSpacing:
                0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.bold,
            /*PERCENT not supported*/
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FavouratePage()));
              },
              child: Icon(
                BootstrapIcons.heart,
                color: Colors.black,
              ),
            ),
          )
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
                    side: BorderSide(width: 2.w, color: Color(0xFFE6EBF2)),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: TextFormField(
                  style: GoogleFonts.sofiaSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
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
                        color: Color(0xFF97A1B0)),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  validator: (task) {
                    if (task == null || task.isEmpty) {
                      return 'Enter your task';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RecipeDetailsScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 16.w, left: 8.w, top: 8.h, bottom: 8.h),
                        width: 327.w,
                        height: 100.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFFAFAFA)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19053336),
                              blurRadius: 16,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 100.w,
                              height: 84.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFF88C3C6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            SizedBox(
                              width: 155,
                              child: Text(
                                'Ever day Easy Rbeef burger',
                                style: GoogleFonts.sofiaSans(
                                  color: Color(0xFF0A2533),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              width: 24.w,
                              height: 24.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFF032628),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r)),
                              ),
                              child: Center(
                                child: Icon(
                                  BootstrapIcons.arrow_right,
                                  color: Colors.white,
                                  size: 15.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_)=>AddRecipeScreen()));},
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF6FB9BE),
      ),
    );
  }
}