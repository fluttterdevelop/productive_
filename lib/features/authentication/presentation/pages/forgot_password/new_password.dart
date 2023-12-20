import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/core/widgets/w_button.dart';
import 'package:productive/core/widgets/w_divider.dart';
import 'package:productive/features/authentication/presentation/login_screen.dart';

import 'package:productive/features/authentication/presentation/widgets/social_media_login_button.dart';
import 'package:productive/features/home/home.dart';

class NewPasswordScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(
        builder: (_) => const NewPasswordScreen(),
      );

  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool isLoginDataValid = false;
  //final mailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final passwordTextEditingController2 = TextEditingController();

  final passwordFocusNode2 = FocusNode();
  final passwordFocusNode = FocusNode();

  final textFieldContentStyle = const TextStyle(
    color: hintTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  final formKey = GlobalKey<FormState>();

  bool isObscure = true;
  String? qiymat;
  bool isEqual = false;

  InputDecoration decoration({
    required String hintText,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 13.5),
        hintStyle: TextStyle(
          color: hintTextColor.withOpacity(.6),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: textFieldBackgroundColor2,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
      );

  @override
  void initState() {
    passwordTextEditingController2.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isLoginDataValid) {
          setState(() {
            isLoginDataValid = true;
          });
        }
      } else {
        if (isLoginDataValid) {
          setState(() {
            isLoginDataValid = false;
          });
        }
      }
    });

    passwordTextEditingController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isLoginDataValid) {
          setState(() {
            isLoginDataValid = true;
          });
        }
      } else {
        if (isLoginDataValid) {
          setState(() {
            isLoginDataValid = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    passwordTextEditingController2.dispose();
    passwordTextEditingController.dispose();
    passwordFocusNode2.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(builder: (context) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (FocusScope.of(context).hasFocus) {
                FocusScope.of(context).unfocus();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    /* const Gap(40), */
                    Container(
                      height: 29,
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(16),
                      child: Text(
                        "Create new password",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Barlow",
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.165,
                        ),
                      ),
                    ),
                    Gap(20),
                    Container(
                      width: 130,
                      height: 130,
                      child: Image.asset("assets/images/girl.png"),
                    ),
                    const Gap(48),
                    TextFormField(
                      style: textFieldContentStyle,
                      cursorColor: cursorColor,
                      focusNode: passwordFocusNode2,
                      controller: passwordTextEditingController2,
                      decoration: decoration(
                        hintText: 'Enter new password',
                        /* suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 13.5),
                            child: SvgPicture.asset(
                              isObscure ? AppIcons.eyeOff : AppIcons.eyeOn,
                            ),
                          ),
                        ), */
                      ),
                      onEditingComplete: () {
                        // TODO: Login
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isObscure,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Iltimos, parolingizni kiriting!';
                        } else if (value.length < 7) {
                          return 'Parol eng kamida 8ta belgidan tashkil topgan bo\'lishi kerak';
                        }
    
                        return null;
                      },
                    ),
                    const Gap(16),
                    TextFormField(
                      style: textFieldContentStyle,
                      cursorColor: cursorColor,
                      focusNode: passwordFocusNode,
                      controller: passwordTextEditingController,
                      decoration: decoration(
                        hintText: 'Confirm password',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 13.5),
                          child: SvgPicture.asset(
                            (isEqual) ? AppIcons.ticker_green : AppIcons.ticker,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          isEqual =
                              (passwordTextEditingController2.text == value);
                        });
                      },
                      onEditingComplete: () {
                        // TODO: Login
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isObscure,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Iltimos, parolingizni kiriting!';
                        } else if (value.length < 7) {
                          return 'Parol eng kamida 8ta belgidan tashkil topgan bo\'lishi kerak';
                        } else if (value != passwordTextEditingController.text) {
                          return 'Parolingiz to\'g\'ri kelmadi!';
                        } /* else if(isEqual==false){
                          return 
                        } */
    
                        return null;
                      },
                    ),
                    /* const Gap(12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: textButtonColor,
                          ),
                        ),
                      ),
                    ),
                    const Gap(16), */
                    const Gap(261),
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 24,
                left: 16,
                right: 16),
                      child: WButton(
                        isDisabled: !isLoginDataValid,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                            /* authUser.user = AuthenticatedUserEntity(
                              email: mailTextEditingController.text,
                              password: passwordTextEditingController.text,
                            );
                            Navigator.of(context).pushNamed('/home'); */
                          }
                        },
                        text: 'Save',
                      ),
                    ),
    
                    /* const Gap(56),
                    const Row(
                      children: [
                        Expanded(child: WDivider()),
                        Gap(6),
                        Text(
                          'OR',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gap(5),
                        Expanded(child: WDivider()),
                      ],
                    ),
                    const Gap(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaLoginButton(
                            onTap: () {}, icon: AppIcons.facebook),
                        const Gap(32),
                        SocialMediaLoginButton(
                            onTap: () {}, icon: AppIcons.google),
                        const Gap(32),
                        SocialMediaLoginButton(
                            onTap: () {}, icon: AppIcons.apple),
                      ],
                    ), */
                  ],
                ),
              ),
            ),
          );
        }),
        
      ),
    );
  }
}
