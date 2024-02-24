import 'package:flutter/material.dart';

import 'ext_colors.dart';

extension StylesX on BuildContext {
  TextStyle get regular => TextStyle(
        color: mindfulBrown,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  TextStyle get medium => TextStyle(
        color: mindfulBrown,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      );

  TextStyle get semiBold => TextStyle(
        color: mindfulBrown,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      );

  TextStyle get bold => TextStyle(
        color: mindfulBrown,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      );
}
