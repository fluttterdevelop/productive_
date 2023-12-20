import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/widgets/w_button.dart';
import 'package:productive/features/authentication/presentation/login_screen.dart';


import 'package:productive/features/authentication/presentation/widgets/social_media_login_button.dart';
import 'package:productive/features/home/home.dart';

import '../../../assets/constants/colors.dart';
import '../../../assets/constants/icons.dart';
import '../../../core/widgets/w_divider.dart';

class SignUpScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
      );

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
double height = 60;
double verticalMargin = 20;
double horizontalMargin = 20;


  bool isSignUpDataValid = false;
  final mailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final textFieldContentStyle = const TextStyle(
    color: hintTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  final formKey = GlobalKey<FormState>();


  bool isObscure = true;

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
  mailTextEditingController.addListener(() {
    if (formKey.currentState!.validate()) {
      if (!isSignUpDataValid) {
        setState(() {
          isSignUpDataValid = true;
        });
      }
    }else{
      if (!isSignUpDataValid) {
        setState(() {
          isSignUpDataValid = false;
        });
      }
    }
  });
   
     passwordTextEditingController.addListener(() {
    if (formKey.currentState!.validate()) {
      if (!isSignUpDataValid) {
        setState(() {
          isSignUpDataValid = true;
        });
      }
    }else{
      if (!isSignUpDataValid) {
        setState(() {
          isSignUpDataValid = false;
        });
      }
    }
  });

    super.initState();
  }


  @override
  void dispose() {
    mailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    mailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (context) {
        return GestureDetector(
          
          behavior: HitTestBehavior.opaque,
          onTap: () {
            //  onTapDown: (_) {
        verticalMargin = 30;
        height = 40;
        horizontalMargin = 40;
        setState(() {});
        print("OnTapDowN BIRINCHI CHIQADI ");
      // };

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
                  const Gap(67),
                  SvgPicture.asset(AppIcons.logo),
                  const Gap(44),
                  TextFormField(
                    style: textFieldContentStyle,
                    cursorColor: cursorColor,
                    focusNode: mailFocusNode,
                    controller: mailTextEditingController,
                    decoration: decoration(hintText: 'Email'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    onEditingComplete: () {
                      passwordFocusNode.requestFocus();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Iltimos, mail kiriting!';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Iltimos, yaroqli mail manzilini kiriting';
                      }return null;
                    },
                  ),
                  const Gap(16),
                  TextFormField(
                    style: textFieldContentStyle,
                    cursorColor: cursorColor,
                    focusNode: passwordFocusNode,
                    controller: passwordTextEditingController,
                    decoration: decoration(
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
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
                      ),
                    ),
                    onEditingComplete: () {
                      print('salom');
                      // TODO: Login
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Iltimos, parolingizni kiriting!';
                      } else if (value.length < 8) {
                        return 'Parol eng kamida 8ta belgidan tashkil topgan bo\'lishi kerak';
                      }
                    },
                  ),
                  const Gap(12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        print('forgot password bosildi');
                      },
                      child: const Text(
                        '',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: textButtonColor,
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),
                  WButton(
                    isDisabled: !isSignUpDataValid,
                    onTap: () {
                      print('hello');
                      if (formKey.currentState!.validate()) {
                        Navigator.pop(context, MaterialPageRoute(builder: (context) =>const  LoginScreen(),),);
                      }
                    },
                    text: 'Sign up',
                  ),
                  const Gap(56),
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
                  ),
                Gap(110),

                 Padding(
                      padding: const EdgeInsets.only(top: 33.0, bottom: 0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen()));
                                },
                                child: Text("Login",
                              style: TextStyle(color: cursorColor),

                                )),
                          ],
                        ),
                      ),
                    ),
                
         

                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 "Don’t have an account ? ",
                //                 textAlign: TextAlign.center,
                               

                //                 style: TextStyle(fontWeight: FontWeight.w500,),
                //               ),
                //               Padding(padding: EdgeInsets.only(right: 10.0),),
                //               Text(
                //                 "Login",
                                
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(fontWeight: FontWeight.bold,color: cursorColor),
                //               )
                //             ],
                //           ),
                
                ],

              ),
            ),
          ),
        );
      }),
    );
  }
}