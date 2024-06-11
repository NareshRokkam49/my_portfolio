import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myportfolio/constants/cColors.dart';
import 'package:myportfolio/constants/cStrings.dart';
import 'package:sizer/sizer.dart';
import '../components/cbuttons.dart';
import '../constants/image_constants.dart';
import '../resourses/text_styles.dart';
import '../utils/display_utils.dart';

class AboutMeScreen extends StatelessWidget {
  AboutMeScreen({super.key});

  final ValueNotifier<bool> showFullBio = ValueNotifier(false);

  final ValueNotifier<bool> showFullHobbies = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cClayColor,
        elevation: 0,
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
          "About Me",
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
            _bioList(),
          ],
        ),
      ),
    );
  }

  Widget _bioList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            ValueListenableBuilder(
                valueListenable: showFullBio,
                builder: (context, value, child) {
                  return Container(
                    decoration: BoxDecoration(
                        color: cWhiteColor,
                        borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bio",
                            style:
                                TextStyles.getSubTital20(textColor: cBlackColor),
                          ),
                          Text(
                            showFullBio.value
                                ? CStrings.bio
                                : CStrings.bio.substring(0, 100) + "...",
                            style:
                                TextStyles.getSubTita16(textColor: cClayColor),
                          ),
                          TextButton(
                            onPressed: () {
                              showFullBio.value = !showFullBio.value;
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  showFullBio.value
                                      ? ImageConstants.arrowUpIconSvg
                                      : ImageConstants.arrowDownIconSvg,
                                  height: 15,
                                  colorFilter: ColorFilter.mode(
                                      showFullBio.value
                                          ? cGrayColor
                                          : cBlackColor,
                                      BlendMode.srcIn),
                                ),
                                hGap(10),
                                Text(
                                  showFullBio.value ? "See less" : "See more",
                                  style: TextStyle(
                                      color: showFullBio.value
                                          ? cGrayColor
                                          : cBlackColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            vGap(20),
            ValueListenableBuilder(
                valueListenable: showFullHobbies,
                builder: (context, value, child) {
                  return Container(
                    decoration: BoxDecoration(
                        color: cWhiteColor,
                        borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hobbies",
                            style:
                                TextStyles.getSubTital20(textColor: cBlackColor),
                          ),
                          Text(
                            showFullHobbies.value
                                ? CStrings.hobbis
                                : CStrings.hobbis.substring(0, 100) + "...",
                            style:
                                TextStyles.getSubTita16(textColor: cClayColor),
                          ),
                          TextButton(
                            onPressed: () {
                              showFullHobbies.value = !showFullHobbies.value;
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  showFullHobbies.value
                                      ? ImageConstants.arrowUpIconSvg
                                      : ImageConstants.arrowDownIconSvg,
                                  height: 15,
                                  colorFilter: ColorFilter.mode(
                                      showFullHobbies.value
                                          ? cGrayColor
                                          : cBlackColor, BlendMode.srcIn),
                                ),
                                hGap(10),
                                Text(
                                  showFullHobbies.value
                                      ? "See less"
                                      : "See more",
                                  style: TextStyle(
                                      color: showFullHobbies.value
                                          ? cGrayColor
                                          : cBlackColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
                radius: 52,
                backgroundColor: cWhiteColor,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(ImageConstants.profileWtoBgPng),
                  backgroundColor: cWhiteColor,
                ),
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
                    style: TextStyles.getSubTita16(textColor: cWhiteColor),
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
        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 10.h),
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
        size.width / 50, size.height, size.width / 3, size.height);
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
