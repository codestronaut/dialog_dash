import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import '../../../../src.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.spacingMd,
              vertical: context.spacingXlg,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: context.l10n.firstAppName,
                          style: context.semiBold.copyWith(
                            fontSize: context.spacingXlg,
                          ),
                          children: [
                            TextSpan(
                              text: context.l10n.lastAppName,
                              style: context.bold.copyWith(
                                color: context.mindfulGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                      (context.spacingXlg * 2.0).vSpace,
                      GlobalLabeledWrapper(
                        isRequired: true,
                        label: context.l10n.emailAddressLabel,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: context.inputDecoration.copyWith(
                            fillColor: Colors.white,
                            hintText: context.l10n.emailAddressHint,
                          ),
                        ),
                      ),
                      context.spacingMd.vSpace,
                      GlobalLabeledWrapper(
                        isRequired: true,
                        label: context.l10n.passwordLabel,
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: context.inputDecoration.copyWith(
                            fillColor: Colors.white,
                            hintText: context.l10n.passwordHint,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.all(context.spacingMd),
                              icon: Icon(
                                Icons.visibility_outlined,
                                color: context.mindfulBrown,
                              ),
                            ),
                          ),
                        ),
                      ),
                      context.spacingXlg.vSpace,
                      SizedBox(
                        width: context.deviceWidth,
                        child: GlobalButton.filled(
                          onTap: () {},
                          child: Text(context.l10n.signInLabel),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: context.l10n.dontHaveAccountLabel,
                        style: context.medium.copyWith(
                          color: context.grayRockDarker,
                        ),
                        children: [
                          WidgetSpan(child: context.spacingXxs.hSpace),
                          TextSpan(
                            text: context.l10n.signUpLabel,
                            style: context.bold.copyWith(
                              color: context.mindfulOrange,
                              decoration: TextDecoration.underline,
                              decorationColor: context.mindfulOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    context.spacingXs.vSpace,
                    Text(
                      context.l10n.forgotPasswordLabel,
                      style: context.bold.copyWith(
                        color: context.mindfulOrange,
                        decoration: TextDecoration.underline,
                        decorationColor: context.mindfulOrange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
