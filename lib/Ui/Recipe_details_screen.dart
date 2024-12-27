import 'dart:io';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final String title;
  final String image;
  final String Incriedient;
  final String description;
  const RecipeDetailsScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.Incriedient,
      required this.description});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            BootstrapIcons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity.w,
                height: 200.h,
                decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: FileImage(File(widget.image)),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.r),
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19053336),
                        blurRadius: 16.r,
                        offset: Offset(0, 2),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      BootstrapIcons.heart,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.title,
              style: GoogleFonts.sofiaSans(
                color: Color(0xFF0A2533),
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
                height: 1.35,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 30.h,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index1) {
                  return Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Container(
                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                      height: 25.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Color(0xFF6FB9BE)),
                      child: Center(
                        child: Text('egg - 2',
                            style: GoogleFonts.mulish(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'This Healthy Taco Salad is the universal delight of taco night Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source',
              style: GoogleFonts.sofiaSans(
                color: Color(0xFF738189),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
