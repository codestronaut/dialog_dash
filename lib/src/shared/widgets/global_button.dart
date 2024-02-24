import 'package:flutter/material.dart';

import '../../src.dart';

enum GlobalButtonStyle {
  filled,
  outlined;

  bool get isFilled => this == GlobalButtonStyle.filled;
  bool get isOutlined => this == GlobalButtonStyle.filled;
}

class GlobalButton extends StatelessWidget {
  const GlobalButton.filled({
    super.key,
    required this.onTap,
    required this.child,
    this.enable = true,
  }) : style = GlobalButtonStyle.filled;

  const GlobalButton.outlined({
    super.key,
    required this.onTap,
    required this.child,
    this.enable = true,
  }) : style = GlobalButtonStyle.outlined;

  final GlobalButtonStyle style;
  final VoidCallback onTap;
  final Widget child;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    if (style.isFilled) {
      return TextButton(
        onPressed: enable ? onTap : null,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: context.mindfulBrown,
          disabledForegroundColor: Colors.white,
          disabledBackgroundColor: context.grayRock,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacingXlg,
            vertical: context.spacingMd,
          ),
          textStyle: context.bold.copyWith(
            fontSize: context.spacingMd,
          ),
        ),
        child: child,
      );
    } else {
      return OutlinedButton(
        onPressed: enable ? onTap : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: context.mindfulBrown,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacingXlg,
            vertical: context.spacingMd,
          ),
          textStyle: context.bold.copyWith(
            fontSize: context.spacingMd,
          ),
        ),
        child: child,
      );
    }
  }
}
