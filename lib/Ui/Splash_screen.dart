import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_recipes/Ui/Home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
          color: Color(0xFF6FB9BE),
          image: DecorationImage(
              image: AssetImage('assets/images/splash_screen.png'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 550.h,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              'Help to keep your recipes with happiness',
              style: GoogleFonts.sofiaSans(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.w800,
                height: 1.30.h,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Container(
              width: 327.w,
              height: 54.h,
              decoration: ShapeDecoration(
                color: Color(0xFF032628),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Get Start',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sofiaSans(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.35.h,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            'Created By Salih ',
            style: GoogleFonts.sofiaSans(
              color: Colors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ));
  }
}
