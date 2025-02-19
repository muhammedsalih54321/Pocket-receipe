import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pocket_recipes/Provider/Receipe_adapter.dart';
import 'package:pocket_recipes/Provider/Receipe_model.dart';
import 'package:pocket_recipes/Provider/Recipe_provider.dart';
import 'package:pocket_recipes/Ui/splash_screen.dart';
import 'package:provider/provider.dart';



void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register the adapter
  Hive.registerAdapter(RecipeAdapter());
  // Open the box where your recipes are stored
 await Hive.openBox<Recipe>('recipes');
  await Hive.openBox<Recipe>('favorite'); 

  runApp(
    ChangeNotifierProvider(
      create: (_) => RecipeProvider(),
      child: MyApp(),
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 845),
        builder: (BuildContext context, Widget? child) {
          return FutureBuilder(
      future: Provider.of<RecipeProvider>(context, listen: false).init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())));
        }
        return
           MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.teal,
            ),
            home: SplashScreen(), // Replace with your home screen
          );
  }
);});}
}
