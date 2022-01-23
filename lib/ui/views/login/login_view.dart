import 'package:flutter/material.dart';
import 'package:hulunfechi/app_constants.dart/string_constants.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/image_builder.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "phoneNumber",
    ),
    FormTextField(
      name: "password",
    ),
  ],
)
class LoginView extends StatelessWidget with $LoginView {
  LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) {
        return Scaffold(
          appBar: hulunfechiAppbar(
            title: 'Login',
          ),
          body: SafeArea(
            child: IgnorePointer(
              ignoring: model.isBusy,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpaceMedium,

                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Login with your account',
                                style: ktsDarkGreyTextStyle.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Welcome back',
                                style:
                                    ktsDarkGreyTextStyle.copyWith(fontSize: 17),
                              ),
                            ),
                          ),

                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Center(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      child: ImageBuilder(
                                          fit: BoxFit.cover,
                                          height: 160,
                                          width: 180,
                                          assetName:
                                              'assets/images/intro_images/hulunFechi.png'),
                                    ),
                                    InputField(
                                      controller: phoneNumberController,
                                      maxLine: 1,
                                      hasFocusedBorder: true,
                                      textInputType: TextInputType.emailAddress,
                                      isReadOnly: model.isBusy,
                                      nextFocusNode: FocusScope.of(context),
                                      placeholder: 'Email',
                                    ),
                                    if (model.phoneNumberFieldHasText)
                                      _ValidationMessage(
                                        title: 'Email $CantBeEmpty',
                                      ),
                                    verticalSpaceMedium,
                                    InputField(
                                      obscureText: true,
                                      maxLine: 1,
                                      hasFocusedBorder: true,
                                      isReadOnly: model.isBusy,
                                      controller: passwordController,
                                      placeholder: 'Password',
                                      nextFocusNode: FocusScope.of(context),
                                    ),
                                    if (model.passwordFieldHasText)
                                      _ValidationMessage(
                                        title: 'Password $CantBeEmpty',
                                      ),
                                    verticalSpaceMedium,
                                    // Align(
                                    //   alignment: Alignment.centerRight,
                                    //   child: TextButton(
                                    //     onPressed: model.onForgotPassword,
                                    //     style: ButtonStyle(
                                    //       splashFactory: NoSplash.splashFactory,
                                    //       padding: MaterialStateProperty.all(
                                    //         EdgeInsets.fromLTRB(5, 0, 5, 15),
                                    //       ),
                                    //     ),
                                    //     child: Text(
                                    //       'Forgot Password?',
                                    //       style: ktsDarkGreyTextStyle.copyWith(
                                    //           color: kcPrimaryColor),
                                    //     ),
                                    //   ),
                                    // ),
                                    if (model.apiValidationMessage != null)
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            model.apiValidationMessage!,
                                            style:
                                                ktsWhiteSmallTextStyle.copyWith(
                                                    color: Colors.red
                                                        .withOpacity(0.8)),
                                          ),
                                        ],
                                      ),
                                    verticalSpaceMedium,
                                    AppButton(
                                      title: 'Login',
                                      busy: model.isBusy,
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        model.login();
                                      },
                                      enabled: !model.isBusy,
                                    )
                                  ]),
                            ),
                          ),
                          verticalSpaceSmall,
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: ktsDarkGreyTextStyle,
                                ),
                                TextButton(
                                  onPressed: model.onSignUp,
                                  child: Text(
                                    'Sign up',
                                    style: ktsGreenBoldTextStyle.copyWith(
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            alignment: Alignment.center,
                            child: ImageBuilder(
                              assetName:
                                  'assets/images/intro_images/hulunfechi.jpg',
                            ),
                          ),
                          // Text(
                          //   'Continue with social account',
                          //   style: ktsWhiteSmallTextStyle.copyWith(
                          //       fontWeight: FontWeight.w200),
                          // ),
                          // AppDivider(),
                          // verticalSpaceSmall,
                          // Padding(
                          //   padding: appSymmetricEdgePadding,
                          //   child: AppButton(
                          //     leadingWidget: Image.asset(
                          //       'assets/images/intro_images/google_icon.png',
                          //       fit: BoxFit.contain,
                          //       height: 30,
                          //     ),
                          //     title: 'Continue with google',
                          //     busy: model.isBusy,
                          //     onTap: () {
                          //       FocusScope.of(context).unfocus();
                          //       model.signInWithGoogle();
                          //     },
                          //     enabled: !model.isBusy,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ValidationMessage extends StatelessWidget {
  const _ValidationMessage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceTiny,
          Text("$title",
              style: ktsSmallWhiteTextStyle.copyWith(
                color: Colors.red.withOpacity(0.7),
              ))
        ],
      ),
    );
  }
}
