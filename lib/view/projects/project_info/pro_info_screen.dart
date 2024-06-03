import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myportfolio/components/cbuttons.dart';
import 'package:myportfolio/constants/cColors.dart';
import 'package:myportfolio/constants/cStrings.dart';
import 'package:myportfolio/constants/image_constants.dart';
import 'package:myportfolio/resourses/text_styles.dart';

import '../../../utils/display_utils.dart';

class ProProjectScreen extends StatelessWidget {
  ProProjectScreen({super.key});
  final List elData = [
    "1. Seamless Patient Registration",
    "2. Effortless Appointment Scheduling",
    "3. Laboratory Referrals Made Easy",
    "4. Streamlined Workflow",
    "5. Improved Patient Care",
    "6. Enhanced Collaboration",
    '7. Better Health Outcomes'
  ];

  final List productDetailsList = [
    CStrings.seamlessPatientRegistration,
    CStrings.effortlessAppointmentScheduling,
    CStrings.laboratoryReferralsMadeEasy,
    CStrings.streamlinedWorkflow,
    CStrings.improvedPatientCare,
    CStrings.enhancedSecurity,
    CStrings.betterHealthOutcomes
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          color: Colors.transparent,
        ),
        title: Text(
          "Pro",
          style: TextStyle(
            fontSize: 20,
            color: cBlackColor,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF7F8F4), Color(0xFF5B6752)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: cBgColor3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                vGap(10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    ImageConstants.proImagePng,
                    fit: BoxFit.cover,
                  ),
                ),
                vGap(10),
                vGap(10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: cWhiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Project Overview",
                        style:
                            TextStyles.getSubTital24(textColor: cPrimeryColor),
                      ),
                      ListView.builder(
                        itemCount: elData.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              vGap(10),
                              Text(
                                elData[index],
                                style: TextStyles.getSubTital20(
                                    textColor: cPrimeryColor),
                              ),
                              vGap(10),
                              Text(productDetailsList[index],
                                  style: TextStyles.getSubTital20(
                                      fontSize: 15, textColor: cClayColor2))
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                vGap(20),
                Container(
                    width: getWidth(context),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: cWhiteColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Project Duration",
                          style: TextStyles.getSubTital24(
                              textColor: cPrimeryColor),
                        ),
                        vGap(10),
                        Text(
                          "6 Months",
                          style: TextStyles.getSubTita15(
                              fontSize: 17, textColor: cClayColor2),
                        ),
                      ],
                    )),
                vGap(20),
                vGap(20),
                Container(
                    width: getWidth(context),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: cWhiteColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tools Used",
                          style: TextStyles.getSubTital24(
                              textColor: cPrimeryColor),
                        ),
                        vGap(10),
                        Text(
                          "Flutter, Dart, Firebase, Php",
                          style: TextStyles.getSubTita15(
                              fontSize: 17, textColor: cClayColor2),
                        ),
                      ],
                    )),
                vGap(20),
                Container(
                    width: getWidth(context),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: cWhiteColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Available In",
                          style: TextStyles.getSubTital24(
                              textColor: cPrimeryColor),
                        ),
                        vGap(10),
                        ListTile(
                          leading: Text(
                            "Play Store",
                            style: TextStyles.getSubTital20(
                                textColor: cClayColor2),
                          ),
                          trailing: CButton(
                              color: Colors.transparent,
                              onPressed: () {
                                showErrorMessage(context, "On Prograss",);
                              },
                              text: SvgPicture.asset(
                                  ImageConstants.downloadIcon)),
                        ),
                        ListTile(
                          leading: Text(
                            "App Store",
                            style: TextStyles.getSubTital20(
                                textColor: cClayColor2),
                          ),
                          trailing: CButton(
                              color: Colors.transparent,
                              onPressed: () {
                                showErrorMessage(context, "On Prograss");
                              },
                              text: SvgPicture.asset(
                                  ImageConstants.downloadIcon)),
                        ),
                      ],
                    )),
                vGap(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
