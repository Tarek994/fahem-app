import 'package:fahem_business/core/resources/colors_manager.dart';
import 'package:fahem_business/core/resources/fonts_manager.dart';
import 'package:fahem_business/core/resources/routes_manager.dart';
import 'package:fahem_business/core/resources/strings_manager.dart';
import 'package:fahem_business/core/resources/values_manager.dart';
import 'package:fahem_business/core/utilities/dialogs.dart';
import 'package:fahem_business/core/utilities/extensions.dart';
import 'package:fahem_business/core/utilities/methods.dart';
import 'package:fahem_business/core/utilities/my_providers.dart';
import 'package:fahem_business/core/utilities/validator.dart';
import 'package:fahem_business/domain/usecases/authentication_account/login_account_usecase.dart';
import 'package:fahem_business/presentation/screens/authentication/controllers/authentication_provider.dart';
import 'package:fahem_business/presentation/screens/authentication/widgets/dont_have_account.dart';
import 'package:fahem_business/presentation/screens/splash/widgets/my_logo.dart';
import 'package:fahem_business/presentation/shared/widgets/custom/custom_button.dart';
import 'package:fahem_business/presentation/shared/widgets/custom/custom_full_loading.dart';
import 'package:fahem_business/presentation/shared/widgets/custom/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingControllerEmailAddress =
      TextEditingController();
  final TextEditingController _textEditingControllerPassword =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Dialogs.showBottomSheetConfirmation(
          context: context,
          message: Methods.getText(StringsManager.doYouWantToExitAnApp)
              .toCapitalized()),
      child: Scaffold(
        backgroundColor: ColorsManager.veryDarkBlue,
        body: Consumer<AuthenticationProvider>(
          builder: (context, provider, _) {
            return CustomFullLoading(
              isShowLoading: provider.isLoading,
              waitForDone: provider.isLoading,
              isShowOpacityBackground: true,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(SizeManager.s16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const MyLogo(
                          height: 150,
                          width: 150,
                        ),
                        const SizedBox(height: SizeManager.s40),
                        Column(
                          children: [
                            // Email Address *
                            CustomTextFormField(
                              controller: _textEditingControllerEmailAddress,
                              keyboardType: TextInputType.emailAddress,
                              labelText:
                                  '${Methods.getText(StringsManager.emailAddress).toTitleCase()} *',
                              prefixIconData: Icons.email,
                              validator: Validator.validateEmailAddress,
                            ),
                            const SizedBox(height: SizeManager.s16),

                            // Password *
                            CustomTextFormField(
                              isPasswordField: true,
                              isSupportClearSuffixIcon: false,
                              controller: _textEditingControllerPassword,
                              textInputAction: TextInputAction.done,
                              labelText:
                                  '${Methods.getText(StringsManager.password).toTitleCase()} *',
                              prefixIconData: Icons.lock,
                              validator: Validator.validatePasswordLength,
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: TextButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              Methods.routeTo(
                                context,
                                Routes.forgotPasswordScreen,
                              );
                            },
                            style: TextButton.styleFrom(
                              visualDensity:
                                  const VisualDensity(horizontal: -4),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: SizeManager.s5),
                            ),
                            child: Text(
                              '${Methods.getText(StringsManager.forgotPassword).toTitleCase()} ${MyProviders.appProvider.isEnglish ? '?' : '؟'}',
                              style: TextStyle(
                                  fontFamily: FontFamilyManager.Poppins,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: SizeManager.s40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff5978a7),
                            minimumSize: Size(
                                MediaQuery.of(context).size.width - 60,
                                36), // Set the width to match parent
                            textStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              LoginAccountParameters loginAccountParameters =
                                  LoginAccountParameters(
                                emailAddress: _textEditingControllerEmailAddress
                                    .text
                                    .trim(),
                                password: _textEditingControllerPassword.text,
                              );
                              MyProviders.authenticationProvider.loginAccount(
                                context: context,
                                loginAccountParameters: loginAccountParameters,
                              );
                            }
                          },
                          child: Text(
                            Methods.getText(StringsManager.login).toUpperCase(),
                            style: TextStyle(
                                fontFamily: FontFamilyManager.PoppinsB,
                                color: Colors.white),
                          ),
                        ),
                        // CustomButton(
                        //
                        //   buttonType: ButtonType.text,
                        //   onPressed: () {
                        //     FocusScope.of(context).unfocus();
                        //     if (_formKey.currentState!.validate()) {
                        //       LoginAccountParameters loginAccountParameters =
                        //           LoginAccountParameters(
                        //         emailAddress: _textEditingControllerEmailAddress
                        //             .text
                        //             .trim(),
                        //         password: _textEditingControllerPassword.text,
                        //       );
                        //       MyProviders.authenticationProvider.loginAccount(
                        //           context: context,
                        //           loginAccountParameters:
                        //               loginAccountParameters);
                        //     }
                        //   },
                        //   text: Methods.getText(StringsManager.login)
                        //       .toUpperCase(),
                        //   width: double.infinity,
                        // ),
                        const SizedBox(height: SizeManager.s40),
                        Text(
                          Methods.getText(
                            StringsManager.orContinueWith,
                          ).toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeightManager.medium,
                                  fontFamily: FontFamilyManager.Poppins,
                                  color: Colors.white),
                        ),
                        const SizedBox(height: SizeManager.s15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: CustomButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  MyProviders.authenticationProvider
                                      .signInWithGoogle(context: context);
                                },
                                buttonType: ButtonType.postIcon,
                                text: Methods.getText(StringsManager.google)
                                    .toCapitalized(),
                                iconData: FontAwesomeIcons.google,
                                buttonColor: ColorsManager.google,
                                textColor: ColorsManager.white,
                                iconColor: ColorsManager.white,
                                borderColor: ColorsManager.google,
                                height: SizeManager.s40,
                              ),
                            ),
                            if (false) const SizedBox(width: SizeManager.s10),
                            if (false)
                              Flexible(
                                child: CustomButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  buttonType: ButtonType.postIcon,
                                  text: Methods.getText(StringsManager.facebook)
                                      .toCapitalized(),
                                  iconData: FontAwesomeIcons.facebookF,
                                  buttonColor: ColorsManager.facebook,
                                  width: SizeManager.s150,
                                  height: SizeManager.s40,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: SizeManager.s30),
                        const DontHaveAccount(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingControllerEmailAddress.dispose();
    _textEditingControllerPassword.dispose();
    super.dispose();
  }
}
