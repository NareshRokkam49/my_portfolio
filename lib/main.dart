
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/routes/app_routes.dart';
import 'package:sizer/sizer.dart';
import 'constants/cColors.dart';
import 'routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyPortfolioApp());
  });
}

class MyPortfolioApp extends StatelessWidget {
  MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        color: cWhiteColor,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          fontFamily: "Roboto",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

       initialRoute: AppRoutes.initial,
       getPages: AppPages.routes,
      );
    });
  }
}
