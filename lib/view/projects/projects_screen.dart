import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/constants/cColors.dart';
import 'package:myportfolio/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

import '../../components/cbuttons.dart';
import '../../constants/image_constants.dart';
import '../../resourses/text_styles.dart';
import '../../utils/display_utils.dart';

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({super.key});
  final List projectImages = [
    ImageConstants.elAttandacePng,
    ImageConstants.proImagePng,
    ImageConstants.mombPng,
    ImageConstants.phrPng,
  ];
  final List projectnames = [
    "EL Attandance App",
    "PRO App",
    "Mana Ooru Mana badi",
    "PHR App"
  ];
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
          "Projects",
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
            _softSkillList(),
          ],
        ),
      ),
    );
  }

  Widget _softSkillList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemCount: projectnames.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                index==0?Get.toNamed(AppRoutes.elProjectProfileScreen):null;
                                  showErrorMessage(context, "onprogress");

              },
              child: Card(
                color: Color(0xffffffff),
                child: Column(
                  children: [
                    Image.asset(
                      projectImages[index],
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              projectnames[index],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyles.getSubTital20(textColor: cClayColor),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: cBlackColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
                radius: 40,
                backgroundImage: AssetImage(ImageConstants.profileWtoBgPng),
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
