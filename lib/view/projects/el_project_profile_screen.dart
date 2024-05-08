import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/components/cbuttons.dart';
import 'package:myportfolio/constants/cColors.dart';
import 'package:myportfolio/constants/image_constants.dart';
import 'package:myportfolio/resourses/text_styles.dart';

import '../../utils/display_utils.dart';

class ElProjectProfileScreen extends StatelessWidget {
  const ElProjectProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getWidth(context),
        height: getHeight(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImageConstants.spashBgPng,
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            vGap(40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CButton(
                      onPressed: () {
                        Get.back();
                      },
                      color: Colors.transparent,
                      text: Icon(
                        Icons.arrow_back,
                        color: cBlackColor,
                      )),
                ),
            
              
                Text(
                  "EL Attadance",
                  style: TextStyles.getSubTital20(textColor: cBlackColor),
                ),
                Text(""),Text("")
                


                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
