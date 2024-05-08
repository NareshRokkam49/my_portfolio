import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/constants/cColors.dart';
import 'package:sizer/sizer.dart';

import '../components/cbuttons.dart';
import '../constants/image_constants.dart';
import '../resourses/text_styles.dart';
import '../utils/display_utils.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cClayColor,
        leading: CButton(
            onPressed: () {
              Get.back();
            },
            color: Colors.transparent,
            text: Icon(
              Icons.arrow_back,
              color: cWhiteColor,
            )),
        centerTitle: true,
        title: Text(
          "Education",
          style: TextStyles.getSubTital20(textColor: cWhiteColor),
        ),
      ),
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
            ClipPathStack(),
            vGap(30),
            _educationList(),
          ],
        ),
      ),
    );
  }

  Widget _educationList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            children: [
              Card(
                color: cWhiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rayagada institute of technology and management.Rayagada,Odisha",
                        style: TextStyles.getSubTital20(textColor: cClayColor),
                      ),
                      Text(
                        "Bachelor of Engineering",
                        style: TextStyles.getSubTita16(textColor: cClayColor),
                      ),
                      Text(
                        "2019 - 2023",
                        style: TextStyles.getSubTita16(textColor: cClayColor),
                      ),
                    ],
                  ),
                ),
              ),
              vGap(20),
              Card(
                color: cWhiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Balaji institute of technology and Science, Gunupur, Odisha",
                        style: TextStyles.getSubTital20(textColor: cClayColor),
                      ),
                      Text(
                        "Diploma of Mechanical Engineering",
                        style: TextStyles.getSubTita16(textColor: cClayColor),
                      ),
                      Text(
                        "2015-2018",
                        style: TextStyles.getSubTita16(textColor: cClayColor),
                      ),
                    ],
                  ),
                ),
              ),
              vGap(20),
              Card(
                color: cWhiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jaganath institute of technology and management. Paralakhemundi Odisha,",
                        style: TextStyles.getSubTital20(textColor: cClayColor),
                      ),
                      Text(
                        "ITI in Fitter",
                        style: TextStyles.getSubTita16(textColor: cClayColor),
                      ),
                      Text(
                        "2011-2012",
                        style: TextStyles.getSubTita16(textColor: cClayColor),
                      ),
                    ],
                  ),
                ),
              ),
              vGap(20),
              Card(
                color: cWhiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Varanasi Govt High school. Kashinagar, Odisha",
                        style: TextStyles.getSubTital20(textColor: cClayColor),
                      ),
                      Text(
                        "Hsc 10th",
                        style: TextStyles.getSubTita16(textColor: cClayColor),
                      ),
                      Text(
                        "2010",
                        style: TextStyles.getSubTita16(textColor: cClayColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      
    );
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
      alignment: Alignment.bottomLeft,
      children: [
        ClipPathTextField(),
        _profile(context),
      ],
    );
  }

  Widget _profile(BuildContext context) {
    return Positioned(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(ImageConstants.profileWtoBgPng),
                backgroundColor: cWhiteColor,
              ),
              hGap(15),
              Column(
                children: [
                  Text(
                    "Rokkam Naresh",
                    style: TextStyles.getSubTital20(),
                  ),
                  vGap(10),
                  Text(
                    "Flutter Developer",
                    style: TextStyles.getSubTita16(textColor: cPrimeryColor),
                  ),
                  vGap(10),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}

class ClipPathTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClippeingClass(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 8.h),
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
        size.width / 50, size.height, size.width / 2, size.height);
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
