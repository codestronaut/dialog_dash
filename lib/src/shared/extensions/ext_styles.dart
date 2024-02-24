import 'package:flutter/material.dart';

import 'ext_colors.dart';
import 'ext_dimens.dart';

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

  InputDecoration get inputDecoration {
    return InputDecoration(
      filled: true,
      fillColor: mindfulCream,
      hintStyle: regular.copyWith(color: grayRockDarker),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: spacingXlg.borderRadius * 2,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: spacingXlg.borderRadius * 2,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mindfulGreen, width: 1.5),
        borderRadius: spacingXlg.borderRadius * 2,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: spacingMd,
        horizontal: spacingLg,
      ),
    );
  }
}
