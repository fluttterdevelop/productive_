import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/images.dart';
import 'package:productive/features/authentication/presentation/login_screen.dart';
import 'package:productive/features/authentication/presentation/pages/forgot_password/new_password.dart';
import 'package:productive/features/home/home.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  PinTheme defaultPinTheme = PinTheme(
    width: 51,
    height: 55,
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: textFieldBackgroundColor2,
      border: Border.all(
        color: pinPutBorderColor.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
  final TextEditingController pinPutController = TextEditingController();
  bool isPinPutValid = false;
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Email verification'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 36),
            child: Column(
              children: [
                Image.asset(AppImages.girlPicture),
                const Gap(20),
                const Text(
                  'Please enter the 4 digital code that send\nto your email address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(12.5),
                Pinput(
                  length: 4,
                  controller: pinPutController,
                  enableSuggestions: isPinPutValid,
                  defaultPinTheme: isPinPutValid
                      ? defaultPinTheme.copyBorderWith(
                          border: Border.all(
                          color: green,
                        ))
                      : defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(
                      color: pinPutBorderColor,
                    ),
                  ),
                  forceErrorState: isError,
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(
                      color: errorColor,
                    ),
                  ),
                  onChanged: (value) {
                    if (value.length == 4) {
                      if ('7777' == value) {
                        isPinPutValid = true;
                        isError = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewPasswordScreen(),
                            ));
                      } else {
                        isError = true;
                      }

                      setState(() {});
                    } else {
                      isPinPutValid = false;
                      isError = false;
                      setState(() {});
                    }
                  },
                ),
                const Gap(32.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you don’t receive code.",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Barlow",
                        color: dontReceive,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(2),
                    Text(
                      "Resend",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Barlow",
                        color: resend,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    
                  ],
                ),
                Gap(50),
              ],
            ),
          ),
        ));
  }
}