import 'package:flutter/material.dart';
import 'package:myportfolio/constants/cColors.dart';

import '../resourses/text_styles.dart';
import '../utils/display_utils.dart';

class IsLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(color: cWhiteColor),
        ),
        hGap(10),
        Text(
          "Loading...",
          style: TextStyles.getSubTita12(
              fontWeight: FontWeight.w500, textColor: cWhiteColor),
        ),
      ],
    );
  }
}
