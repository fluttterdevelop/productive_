import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/features/authentication/presentation/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 1);
              });
            },
            children: [
              buildPage1(),
              buildPage2(),
            ],
          ),
          onLastPage
              ? Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 42),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Stack(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: wButtonColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    _controller.jumpToPage(0);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(AppIcons.back),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(101),
                        SmoothPageIndicator(
                          effect: ExpandingDotsEffect(
                            activeDotColor: cursorColor,
                            dotColor: cursorColor.withOpacity(0.32),
                            spacing: 4,
                            dotWidth: 8,
                            dotHeight: 8,
                            radius: 12,
                            strokeWidth: 24,
                          ),
                          controller: _controller,
                          count: 2,
                        ),
                        Gap(102),
                        Stack(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: wButtonColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  _controller.nextPage(
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.linear);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(AppIcons.next),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(bottom: 42),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Gap(169 + 24),
                      SmoothPageIndicator(
                        effect: ExpandingDotsEffect(
                          activeDotColor: cursorColor,
                          dotColor: cursorColor.withOpacity(0.32),
                          spacing: 4,
                          dotWidth: 8,
                          dotHeight: 8,
                          radius: 12,
                          strokeWidth: 24,
                        ),
                        controller: _controller,
                        count: 2,
                      ),
                      Gap(108),
                      Stack(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: wButtonColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.linear);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(AppIcons.next),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildPage1() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                        color: textButtonColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 83),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 310,
            width: double.maxFinite,
            child: Image.asset("assets/images/picture1.png"),
          ),
        ),
        const Gap(40),
        Column(
          children: [
            const Text(
              "Easy Time Management",
              style: TextStyle(
                color: onPrimaryColor,
                fontSize: 24,
                fontFamily: "Barlow",
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(6),
            Text(
              "We help you stay organized and \n                manage your day",
              style: TextStyle(
                color: hintTextColor.withOpacity(0.5),
                fontSize: 18,
                fontFamily: "Barlow",
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(123),
          ],
        ),
      ],
    );
  }

  Widget buildPage2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Gap(310),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "SKIP",
                    style: TextStyle(
                      color: textButtonColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 83),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 310,
            width: double.maxFinite,
            child: Image.asset("assets/images/picture2.png"),
          ),
        ),
        const Gap(40),
        Column(
          children: [
            const Text(
              "Track Your Expense",
              style: TextStyle(
                color: onPrimaryColor,
                fontSize: 24,
                fontFamily: "Barlow",
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(6),
            Text(
              "We help you organize your expenses \n                     easily and safely",
              style: TextStyle(
                color: hintTextColor.withOpacity(0.5),
                fontSize: 18,
                fontFamily: "Barlow",
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(123),
          ],
        ),
      ],
    );
  }
}
