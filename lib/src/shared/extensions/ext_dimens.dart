import 'package:flutter/material.dart';

extension DimensX on BuildContext {
  double get spacingNone => 0.0;
  double get spacingXxs => 4.0;
  double get spacingXs => 8.0;
  double get spacingSm => 12.0;
  double get spacingMd => 16.0;
  double get spacingLg => 20.0;
  double get spacingXlg => 24.0;

  double get deviceWidth => MediaQuery.of(this).size.width;
  double get deviceHeight => MediaQuery.of(this).size.height;
}

extension LayoutX on double {
  SizedBox get vSpace => SizedBox(height: this);
  SizedBox get hSpace => SizedBox(width: this);
  BorderRadius get borderRadius => BorderRadius.circular(this);
  Radius get radius => Radius.circular(this);
}
