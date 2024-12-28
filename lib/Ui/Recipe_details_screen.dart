import 'dart:io';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final String title;
  final String image;
  final List<dynamic> Incriedient;
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
            Container(padding: EdgeInsets.all(12),
              width: double.infinity.w,
              height: 200.h,
              decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: FileImage(File(widget.image)),
                    fit: BoxFit.cover,
                  ),
                  color: Color(0xFF0A2533),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.r),
                  )),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: Color(0xFF0A2533),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
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
              child: Wrap(
                spacing: 5.w, // Horizontal spacing between items
                runSpacing: 10.h, // Vertical spacing between rows
                children: widget.Incriedient.map((item) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: Color(0xFFE6EBF2),
                    ),
                    child: Text(
                      item.toString(),
                      style: GoogleFonts.mulish(
                        color: Color(0xFF0A2533),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.description,
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
