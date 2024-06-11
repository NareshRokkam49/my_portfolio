import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myportfolio/components/cbuttons.dart';
import 'package:myportfolio/constants/cColors.dart';
import 'package:myportfolio/constants/image_constants.dart';
import 'package:myportfolio/resourses/text_styles.dart';
import 'package:myportfolio/routes/app_routes.dart';
import 'package:myportfolio/utils/display_utils.dart';
import 'package:myportfolio/view/pdf_view_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart';


class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});
  final List<String> actionList = [
    'About Me',
    'Experience',
    'Education',
    'Skills',
    'Projects',
    "Resume"
  ];

  final List<String> iconsList = [
    ImageConstants.personIconSvg,
    ImageConstants.expIconSvg,
    ImageConstants.educationIconSvg,
    ImageConstants.skillIconSvg,
    ImageConstants.projectIconSvg,
    ImageConstants.resumeIcon
  ];
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPathStack(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _quickActionCard(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickActionCard() {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: actionList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5 / 1.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 16),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: cWhiteColor,
              boxShadow: [
                BoxShadow(
                  color: cGrayColor,
                  blurRadius: 8.0,
                  spreadRadius: .09,
                  offset: Offset(
                    .05,
                    .05,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: cWhiteColor),
            ),
            child: InkWell(
              onTap: () {
                switch (index) {
                  case 0:
                    Get.toNamed(AppRoutes.aboutMeScreen);
                    break;
                  case 1:
                    Get.toNamed(AppRoutes.exprienceScreen);
                    break;
                  case 2:
                    Get.toNamed(AppRoutes.educationScreen);
                    break;
                  case 3:
                    Get.toNamed(AppRoutes.skillsScreen);
                    break;
                  case 4:
                    Get.toNamed(AppRoutes.projectsScreen);
                    break;

                  case 5:
        
                   Get.to(() => PDFPreviewScreen());
                    break;
                  default:
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconsList[index],
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  vGap(6),
                  Text(
                    actionList[index],
                    style: TextStyles.getSubTita16(textColor: cBlackColor),
                  ),
                   
                
                ],
              ),
            ),
          );
        });
  }


}
  
  downloadfile(String filepath, BuildContext context) async {
    try {
      var time = DateTime.now().microsecondsSinceEpoch;
      var path = "/storage/emulated/0/Download/naresh-$time.pdf";
      var file = File(path);
      var res =
          await get(Uri.parse(filepath)); // var responce=await http.get(url),

      file.writeAsBytes(res.bodyBytes);
      showSuccessMessage(context, "Pdf succussfully downloaded");
    } catch (e) {
      showErrorMessage(context, "Error occured");
    }
  }

  
      


class ClipPathStack extends StatefulWidget {
  @override
  State<ClipPathStack> createState() => _ClipPathStackState();
}

class _ClipPathStackState extends State<ClipPathStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        ClipPathTextField(),
        _profile(context),
      ],
    );
  }

  Widget _profile(BuildContext context) {
    return Positioned(
        top: 60,
        child: Column(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundColor: cWhiteColor,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(ImageConstants.profileWtoBgPng),
                backgroundColor: cWhiteColor,
              ),
            ),
            Text(
              "Rokkam Naresh",
              style: TextStyles.getSubTital20(),
            ),
            vGap(10),
            Text(
              "Flutter Developer",
              style: TextStyles.getSubTita16(textColor: cWhiteColor),
            ),
            vGap(10),
            CButton(
                color: cWhiteColor,
                width: getWidth(context) / 3,
                height: 40,
                onPressed: () {
                  showErrorMessage(context, "onprogress");
                },
                text: Text(
                  "Hire Me",
                  style: TextStyles.getSubTita16(textColor: cClayColor),
                )),
          ],
        ));
  }
}

class ClipPathTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClippeingClass(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 18.h),
        decoration: BoxDecoration(color: cClayColor),
      ),
    );
  }
}

class ClippeingClass extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 50, size.height, size.width / 1.9, size.height);
    path.quadraticBezierTo(size.width - (size.width / 50), size.height,
        size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
