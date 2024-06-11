import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myportfolio/components/cbuttons.dart';
import 'package:myportfolio/constants/cColors.dart';
import 'package:myportfolio/constants/image_constants.dart';
import 'package:myportfolio/resourses/text_styles.dart';
import 'package:myportfolio/routes/app_routes.dart';
import 'package:myportfolio/utils/display_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:geolocator/geolocator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 133, 113),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 128, 133, 113),
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          CButton(
              color: Colors.transparent,
              onPressed: () {
                Share.share(
                    "https://drive.google.com/uc?export=download&id=1etuPv7NH9uPcm9eT0wC_4X9bLuaTVqSO");
              },
              text: Icon(
                Icons.share,
                color: cWhiteColor,
              )),
          hGap(10),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: getWidth(context),
          height: getHeight(context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImageConstants.spashBgPng,
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _profile(),
                  vGap(20),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff5B6752),
                        borderRadius: BorderRadius.circular(18)),
                    width: getWidth(context),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          _nameWidget(),
                          vGap(10),
                          Divider(),
                          vGap(10),
                          _mobileAndMailWidget(context),
                          vGap(20),
                          _shareDataWidget()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.dashBoardScreen);
      },
      child: Image.asset(
        ImageConstants.profilePng,
        scale: 4,
      ),
    );
  }

  Widget _nameWidget() {
    return Column(
      children: [
        Text(
          "Rokkam Naresh",
          style: TextStyles.getSubTital20(),
        ),
        vGap(10),
        Text(
          "Flutter Developer",
          style: TextStyles.getSubTita16(textColor: cWhiteColor),
        )
      ],
    );
  }

  Widget _mobileAndMailWidget(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            _makeLauncher(
                'mailto:nareshrokkam49@gmail.com?subject=Your Subject Here&body=Your Email Body Here');
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffF7F8F4),
                  Color.fromARGB(255, 128, 133, 113),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            width: getWidth(context),
            child: ListTile(
              leading: Image.asset(ImageConstants.mailPng),
              title: Text(
                "Email",
                style: TextStyles.getSubTita14(),
              ),
              subtitle: Text(
                "nareshrokkam49@gmail.com",
                style: TextStyles.getSubTita14(),
              ),
            ),
          ),
        ),
        vGap(20),
        InkWell(
          onTap: () {
            _makeLauncher('tel:+917702495549');
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffF7F8F4),
                    Color.fromARGB(255, 128, 133, 113),
                  ],
                ),
                borderRadius: BorderRadius.circular(12)),
            width: getWidth(context),
            child: ListTile(
              leading: Image.asset(ImageConstants.callPng),
              title: Text(
                "Mobile Number",
                style: TextStyles.getSubTita14(),
              ),
              subtitle: Text(
                "+91 7702495549",
                style: TextStyles.getSubTita14(),
              ),
            ),
          ),
        ),
        vGap(20),
        InkWell(
          onTap: () {
            getDirections(17.459080, 78.432480, context);
          },
          child: Container(
            decoration: BoxDecoration(
                color: cWhiteColor,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffF7F8F4),
                    Color.fromARGB(255, 128, 133, 113),
                  ],
                ),
                borderRadius: BorderRadius.circular(12)),
            width: getWidth(context),
            child: ListTile(
              leading: Image.asset(ImageConstants.addressPng),
              title: Text(
                "Address",
                style: TextStyles.getSubTita14(),
              ),
              subtitle: Text(
                "Bharat nagar, Hyderabad",
                style: TextStyles.getSubTita14(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _shareDataWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CButton(
            color: Colors.transparent,
            onPressed: () {
              _makeLauncher(
                  "https://www.linkedin.com/in/rokkam-naresh-985a94176/");
            },
            text: SvgPicture.asset(
              ImageConstants.linkedinIcon,
            )),
        CButton(
            color: Colors.transparent,
            onPressed: () {
              _makeLauncher("https://github.com/NareshRokkam49");
            },
            text: SvgPicture.asset(
              ImageConstants.gitIcon,
            )),
        CButton(
            color: Colors.transparent,
            onPressed: () {
              _makeLauncher("https://x.com/nareshrokkam49");
            },
            text: SvgPicture.asset(
              ImageConstants.twitterIcon,
            )),
        CButton(
            color: Colors.transparent,
            onPressed: () {
              _makeLauncher("https://www.facebook.com/jan.167/");
            },
            text: SvgPicture.asset(
              ImageConstants.fbIcon,
            )),
        CButton(
            color: Colors.transparent,
            onPressed: () {
              _makeLauncher("https://www.instagram.com/_urstruly_naresh/");
            },
            text: SvgPicture.asset(
              ImageConstants.instaIcon,
            ))
      ],
    );
  }

  Future<void> _makeLauncher(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void getDirections(
      double latitude, double longitude, BuildContext context) async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        showErrorMessage(context, 'Location services are disabled.');
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          showErrorMessage(context, 'Location permissions are denied');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        showErrorMessage(context,
            'Location permissions are permanently denied, we cannot request permissions.');
        return;
      }

      String googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      final Uri url = Uri.parse(googleMapsUrl);

      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        showErrorMessage(
            context, "Could not launch the map. Please try again.");
      }
    } catch (e) {
      showErrorMessage(context, "An error occurred. Please try again.");
    }
  }

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
