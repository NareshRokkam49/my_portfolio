import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/constants/cColors.dart';
import 'package:sizer/sizer.dart';

import '../components/cbuttons.dart';
import '../constants/image_constants.dart';
import '../resourses/text_styles.dart';
import '../utils/display_utils.dart';

// ignore: must_be_immutable
class SkillsScreen extends StatelessWidget {
   SkillsScreen({super.key});
    TabController? _tabController;

   final List<String> technicalSkill =[
    "Flutter","Dart","Firebase","Push notifications","Git Hub/Git Lab","Source Tree","Rest Apis"," payment gateways"," face detection"
   ];
     final List<String> technicalSub =[
    "Advanced","Advanced","Intermediate","Intermediate","Advanced","Advanced","Advanced","Intermediate","Intermediate"
   ];
     final List<String> softSkill=[
    "Communication","Teamwork","Critical thinking","Time Management","Leadership","Decision-making","Patience"
   ];
     final List<String> Other=[
    "English","Hindi","Telugu","Odiya"
   ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            "Skills",
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
             TabBar(
                 labelColor: cWhiteColor,
                 indicatorSize: TabBarIndicatorSize.tab,
                 indicatorColor: cRedColor,
                 unselectedLabelColor:
                     cGrayColor,
             
                 indicator: BoxDecoration(
                     color: cPrimeryColor,
                     borderRadius: BorderRadius.circular(25)),
                 automaticIndicatorColorAdjustment: true,
                 controller: _tabController,
                 tabs: [
                   Text(
                    "Technical",
                     textAlign: TextAlign.center,
                   ),
                   Text(
                     "Soft Skills",
                     textAlign: TextAlign.center,
                   ),
                    Text(
                     "Other",
                     textAlign: TextAlign.center,
                   ),
                 ]),
                    Expanded(
                      child: TabBarView(controller: _tabController, children: [
                        _techList(),
                        _softSkillList(),
                        _otherList()
                      ]),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget _techList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: technicalSkill.length,
      itemBuilder: (context, index) {
        return Card(  color: cWhiteColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  technicalSkill[index],
                  style: TextStyles.getSubTital20(textColor: cClayColor),
                ),
                Text(
                  technicalSub[index],
                  style: TextStyles.getSubTita16(textColor: cClayColor),
                ),
          
              ],
            ),
          ),
        );
      },
       
      ),
    );
  }

  
  Widget _softSkillList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: softSkill.length,
      itemBuilder: (context, index) {
        return Card(  color: cWhiteColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  softSkill[index],
                  style: TextStyles.getSubTital20(textColor: cClayColor),
                ),
               
          
              ],
            ),
          ),
        );
      },
       
      ),
    );
  }

  
  Widget _otherList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: Other.length,
      itemBuilder: (context, index) {
        return Card(  color: cWhiteColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Other[index],
                  style: TextStyles.getSubTital20(textColor: cClayColor),
                ),
               
          
              ],
            ),
          ),
        );
      },
       
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
