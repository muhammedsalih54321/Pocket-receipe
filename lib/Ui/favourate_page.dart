import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouratePage extends StatefulWidget {
  const FavouratePage({super.key});

  @override
  State<FavouratePage> createState() => _FavouratePageState();
}

class _FavouratePageState extends State<FavouratePage> {
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
            color: Color(0xFF0A2533),
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 340 / 400,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(12),
                        width: 156.w,
                        height: 198.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFFAFAFA)),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19053336),
                              blurRadius: 16.r,
                              offset: Offset(0, 2),
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
                                color: Color(0xFFC4C4C4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 28.w,
                                    height: 28.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x19053336),
                                          blurRadius: 16.r,
                                          offset: Offset(0, 2),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      child: Icon(
                                        BootstrapIcons.heart_fill,
                                        color: Color(0xFF6FB9BE),
                                        size: 15.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            SizedBox(
                              width: 132.w,
                              child: Text(
                                'Sunny Egg & Toast Avocado',
                                style: GoogleFonts.sofiaSans(
                                  color: Color(0xFF0A2533),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  height: 1.35.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
