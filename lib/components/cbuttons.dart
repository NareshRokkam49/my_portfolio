import 'package:flutter/cupertino.dart';

import '../constants/cColors.dart';

class CButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget text;
  final double? width;
  final double? height;
  final TextStyle? style;
  final Color? color;
  final Color? textColor;
  final Color? loadingColor;
  final EdgeInsets? contentPadding;
  final Color? borderColor;
  final double? borderRadius;
  final bool? loadingView;
  final Widget? child;
  final BoxBorder? borderColor2;
  CButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.color,
    this.style,
    this.borderColor2,
    this.loadingColor,
    this.textColor,
    this.loadingView,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
    this.child,
    String? value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                      border:borderColor2 ,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          color: onPressed != null
              ? (color ?? (borderColor ?? cPrimeryColor))
              : null),
      width: width,
      height: height == null ? 52 : height,
      child: CupertinoButton(
        minSize: 45,
        pressedOpacity: .1,
        
        padding: EdgeInsets.all(0),
        onPressed: (loadingView ?? false) ? () {} : onPressed,
        child: Padding(
          padding: contentPadding ?? const EdgeInsets.all(8.0),
          child: (loadingView ?? false) ? Center(child: child) : text,
        ),
      ),
    );
  }
}
