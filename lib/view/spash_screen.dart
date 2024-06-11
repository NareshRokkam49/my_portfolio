import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/routes/app_routes.dart';
import '../constants/image_constants.dart';
import '../utils/display_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: getWidth(context),
      height: getHeight(context),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              ImageConstants.spashBgPng,
            ),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          vGap(30),
             Image.asset(ImageConstants.latterNPng),
             Spacer(),
             Image.asset(ImageConstants.profileWtoBgPng),
         
        ],
      ),
    )));
  }

  @override
  void initState() {
      getValidation();
    super.initState();

    
  }
    getValidation() async {

  
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.profileScreen
          );
    });
  }
}
