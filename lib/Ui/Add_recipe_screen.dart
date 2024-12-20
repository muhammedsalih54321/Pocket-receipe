import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final Title = TextEditingController();
  final incrediant = TextEditingController();
  final description = TextEditingController();
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
              SizedBox(height: 20.h,),
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
              TextFormField(maxLines: 20,
              minLines: 2,
                controller: incrediant,
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
                  hintText: 'Incriedients  ',
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
                validator: (Incriedient) {
                  if (Incriedient!.isEmpty) {
                    return 'Enter the Incriedients!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h,),
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
              TextFormField(maxLines: 50,
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
            ],
          ),
        ),
      ),
    );
  }
}
