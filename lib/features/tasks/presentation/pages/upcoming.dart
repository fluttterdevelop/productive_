import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            // gym uchun upcoming
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(
                /* top: 8,
           bottom: 8,
           right: 8, */
                left: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: textFieldBackgroundColor,
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: upcoming_gym,
                    ),
                    child: SvgPicture.asset(AppIcons.gym),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gym time',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        '03:00 PM - 04:30 PM',
                        style: TextStyle(fontSize: 14, color: grey),
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 11),
                    child: Container(
                      margin: EdgeInsets.only(left: 25),

                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: 2,
                          color: activeColor,
                        ),
                      ),
                      // margin: EdgeInsets.only(right: 30),
                    ),
                  ),
                  Container(
                    child: SvgPicture.asset(
                      AppIcons.gym_corner,
                      height: 54,
                      width: 15,
                    ),
                  )
                ],
              ),
            )

            // meeet uchun upcoming
            ,

            Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  padding: const EdgeInsets.only(
                    /* top: 8,
                bottom: 8,
                right: 8, */
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: textFieldBackgroundColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: upcoming_meet,
                            ),
                            child: SvgPicture.asset(AppIcons.meet),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Meet the cdevs team',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '05:00 PM - 05:30 PM',
                                style: TextStyle(fontSize: 14, color: grey),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 11),
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  width: 2,
                                  color: activeColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(8),
                      const Padding(
                        padding: EdgeInsets.only(right: 11),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'We will discuss the new Tasks of the calendar pages',
                                overflow: TextOverflow.visible,
                                style: TextStyle(fontSize: 14, color: white),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Gap(8),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.link_meet),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(4),
                                    bottomRight: Radius.circular(4)),
                                color: secondaryColor),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: Text(
                                '',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // study uchun upcoming
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(
                /* top: 8,
              bottom: 8,
              right: 8, */
                left: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: textFieldBackgroundColor,
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: upcoming_study,
                    ),
                    child: SvgPicture.asset(AppIcons.study),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Study for the constitutional\njudiciary test',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        '06:00 PM - 08:30 PM',
                        style: TextStyle(fontSize: 14, color: grey),
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 11),
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: 2,
                          color: activeColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: SvgPicture.asset(
                      AppIcons.study_corner,
                      height: 74,
                      width: 10,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
