import 'package:flutter/material.dart';

import '../../src.dart';

class GlobalLabeledWrapper extends StatelessWidget {
  const GlobalLabeledWrapper({
    super.key,
    this.isRequired = false,
    required this.label,
    required this.child,
  });

  final bool isRequired;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: context.semiBold.copyWith(fontSize: context.spacingMd),
            children: isRequired
                ? [
                    WidgetSpan(child: context.spacingXxs.hSpace),
                    TextSpan(
                      text: '*',
                      style: context.regular.copyWith(
                        color: context.mindfulRed,
                      ),
                    ),
                  ]
                : null,
          ),
        ),
        context.spacingXs.vSpace,
        child,
      ],
    );
  }
}
