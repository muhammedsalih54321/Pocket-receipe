import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_recipes/Ui/Home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    _navigateotherscreen();
  }

  _navigateotherscreen() async {
    await Future.delayed(Duration(seconds:3), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        decoration: BoxDecoration(color:Color(0xFF6FB9BE) ,
            // image:
            //     DecorationImage(image: AssetImage('assets/images/Splash.png'),fit: BoxFit.cover)),
       ) ),
    );
  }
}
