import 'package:flutter/material.dart';

import '../constants/cColors.dart';

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

vGap(double height) {
  return SizedBox(
    height: height,
  );
}

hGap(double width) {
  return SizedBox(width: width);
}

void showSuccessMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(
        child: Text(
      message,
      style: TextStyle(color: cWhiteColor),
    )),
    backgroundColor: Colors.lightGreen,
  ));
}

void showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(message, style: TextStyle(color: cWhiteColor))),
    backgroundColor: Colors.red,
  ));
}

loadingText() {
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          color: cWhiteColor,
        ),
      ),
      hGap(10),
      Text(
        "Loading...",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      )
    ],
  );
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;
bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 1300 &&
    MediaQuery.of(context).size.width >= 600;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1300;
