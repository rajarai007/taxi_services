import 'package:app/utils/app_theme.dart';
import 'package:flutter/material.dart';

abstract class BaseClass<T extends StatefulWidget> extends State<T> {
  BaseClass() {}

  buttonStyle(
      {Color? backgroundColor,
      Color? foregroundColor,
      Color borderColor = Colors.transparent,
      Color shadowColor = Colors.transparent,
      double paddingHorizontal = 8,
      double paddingVertical = 8,
      double borderRadius = 8,
      BorderRadiusGeometry? borderRadiusGeometry,
      double elevation = 0,
      double borderWidth = 1.2}) {
    return TextButton.styleFrom(
        foregroundColor: foregroundColor,
        elevation: elevation,
        shadowColor: shadowColor,
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal, vertical: paddingVertical),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadiusGeometry ??
              BorderRadius.circular(borderRadius), // <-- Radius
        ),
        side: BorderSide(width: borderWidth, color: borderColor),
        backgroundColor: backgroundColor);
  }

  bool isNullOrEmpty(String? data) {
    return data == null || data == '';
  }

  Widget getPlaceHolder() => Container(color: AppTheme.colorGrey);
}
