import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';

class AllPage extends StatelessWidget {
  const AllPage({super.key});
// new version

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // all 1
            Column(
              children: [
                Container(
                  margin:
                  const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  padding: const EdgeInsets.only(
                    // top: 8,
                    // bottom: 8,
                    // right: 8,
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
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(AppIcons.bag),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create navigation bar',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: grey,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '10:00 PM - 11:00 PM',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: grey,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 11),
                            child: Column(
                              children: [
                                SvgPicture.asset(AppIcons.nike),

                                // SvgPicture.asset(AppIcons.english_corner),

                                // Container(

                                //   height: 18,
                                //   width: 18,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(6),
                                //     border: Border.all(
                                //       width: 2,
                                //       color: activeColor,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 11),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                  'I will design a navigation bar for the application I am \nworking on, and choose it with suitable colors ',
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: white,
                                    fontFamily: 'Barlow',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: grey,
                                    decorationThickness: 2,
                                  )),
                            ),
                          ],
                        ),
                      ),


                      Gap(8),
                    ],
                  ),
                ),
              ],
            ),

            // all 2
            Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     SvgPicture.asset(AppIcons.english_corner),
                //   ],
                // ),
                Container(
                  margin:
                  const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    right: 8,
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
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: upcoming_meet,
                            ),
                            child: SvgPicture.asset(AppIcons.study),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'English Study',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16,
                                  decoration: TextDecoration
                                      .lineThrough, // strikethrough
                                  decorationColor: grey,
                                ),
                                // align-self: stretch;
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '12:00 PM - 01:30 PM',
                                style: TextStyle(
                                  fontSize: 14, color: grey,
                                  decoration: TextDecoration
                                      .lineThrough, // strikethrough
                                  decorationColor: grey,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 11),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppIcons.nike),
                                // Positioned(
                                //     right: 100,
                                //     child: SvgPicture.asset(
                                //         AppIcons.english_corner)),
                                const Column(
                                  children: [
                                    // Container(

                                    //   height: 18,
                                    //   width: 18,
                                    //   decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(6),
                                    //     border: Border.all(
                                    //       width: 2,
                                    //       color: activeColor,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 11),
                        child: Row(
                          children: [
                            Expanded(
                              child:
                              Text('Review of the acoustics course lessons',
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 14, color: white,
                                    fontFamily: 'Barlow',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration
                                        .lineThrough, // strikethrough
                                    decorationColor:
                                    grey, // strikethrough rangi
                                    decorationThickness: 2,
                                  )),
                            ),
                          ],
                        ),
                      ),


                      Gap(8),


                    ],
                  ),
                ),
              ],
            ),

            // all 3

            Column(
              children: [
                Container(
                  margin:
                  const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  padding: const EdgeInsets.only(
                    // top: 8,
                    // bottom: 8,
                    // right: 8,
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
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(AppIcons.clean),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cleaning my room',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: grey,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '08:00 PM - 08:30 PM',
                                style: TextStyle(
                                  fontSize: 14, color: grey,
                                  decoration: TextDecoration
                                      .lineThrough, // strikethrough
                                  decorationColor: grey,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 11),
                            child: Column(
                              children: [
                                //  Checkbox(value: true, onChanged: (v){}),
                                SvgPicture.asset(AppIcons.nike),

                                // Container(

                                //   height: 18,
                                //   width: 18,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(6),
                                //     border: Border.all(
                                //       width: 2,
                                //       color: activeColor,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 11),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                  'I will sort the books, redecorate the room',
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 14, color: white,
                                    fontFamily: 'Barlow',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration
                                        .lineThrough, // strikethrough
                                    decorationColor:
                                    grey, // strikethrough rangi
                                    decorationThickness: 2,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Gap(8),
                    ],
                  ),
                ),
              ],
            ),





            // gym uchun upcoming
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(
                //  top: 8,
                //  bottom: 8,
                //  right: 8,
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
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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

                    child: SvgPicture.asset(AppIcons.gym_corner,height: 54, width: 15,),

                  )
                ],
              ),
            )



            ,

            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16,bottom: 16,right: 16),
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    right: 8,
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: textFieldBackgroundColor,
                  ),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              SizedBox(height: 2,),
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
                                borderRadius: BorderRadius.only(topRight: Radius.circular(4),bottomRight: Radius.circular(4)),
                                color: secondaryColor
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                              child: Text('',style: TextStyle(fontSize: 12),),
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
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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

                    child: SvgPicture.asset(AppIcons.study_corner,height: 74, width: 10,),

                  )
                ],
              ),
            )






          ],
        ),
      ),
    );
  }
}
