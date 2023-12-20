import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/images.dart';
import 'package:productive/features/authentication/presentation/pages/verification/verification_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final textFieldContentStyle = const TextStyle(
    color: hintTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final mailFocusNode = FocusNode();

  bool isEmailValid = false;
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
    emailController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isEmailValid) {
          setState(() {
            isEmailValid = true;
          });
        }
      } else {
        if (isEmailValid) {
          setState(() {
            isEmailValid = false;
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot password',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(42),
            Image.asset(
              AppImages.profilePicture,
              height: 130,
              width: 130,
            ),
            const Gap(74),
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )),
            const Gap(16),

            Form(
              key: formKey,
              child: TextFormField(
                focusNode: mailFocusNode,
                style: textFieldContentStyle,
                cursorColor: cursorColor,
                controller: emailController,
                decoration: decoration(hintText: 'Email'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                onEditingComplete: () {
                  // passwordFocusNode.requestFocus();
                },
                validator: (value) {
                  print('ishlayapti');
                  if (value == null || value.isEmpty) {
                    return 'Iltimos, mail kiriting!';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Iltimos, yaroqli mail manzilini kiriting';
                  }

                  return null;
                },
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('change'),
            // )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: ElevatedButton(
          onPressed: isEmailValid
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerificationPage(),
                    ),
                  );
                }
              : null,
          child: const Text(
            'Recover Password',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}