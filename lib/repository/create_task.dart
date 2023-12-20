import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/features/home/home.dart';
import 'package:provider/provider.dart';

import '../assets/constants/icons.dart';
import '../models/priority.dart';
import '../tasksBloc/tasks_bloc.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController noteController;

  final random = Random();

  final list = [
    'assets/icons/upcoming/work.svg',
    'assets/icons/upcoming/meet.svg',
    'assets/icons/upcoming/gym.svg',
  ];

  DateTime? startDate;
  DateTime? dueDate;
  Priority? priority;
  String? icon;
  @override
  void initState() {
    icon = "assets/icons/tasks/tasks_solid.svg";

    titleController = TextEditingController();
    noteController = TextEditingController();

    super.initState();
  }

  int selectedContainerIndex = -1;

  void onContainerPressed(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              AppIcons.arrow,
              width: 9.0,
              height: 18.0,
            ),
          ),
        ),
        title: const Text(
          'Create Task',
          style: TextStyle(
              color: inactiveColor, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        titleSpacing: 60.0,
        backgroundColor: scaffoldBackgroundColor,
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (modalBottomSheetContext) {
                          return Container(
                              width: 420,
                              height: 359,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0)),
                                color: darkBlue,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  3,
                                  (index) => GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      setState(() {
                                        icon = list[index];
                                      });
                                      Navigator.of(modalBottomSheetContext)
                                          .pop();
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: getColorByIndex(index),
                                      ),
                                      child: SvgPicture.asset(
                                        list[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.57),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(
                          random.nextInt(255),
                          random.nextInt(255),
                          random.nextInt(255),
                          1,
                        ),
                      ),
                      child: icon != null ? SvgPicture.asset(icon!) : null,
                    ),
                  ),
                  const Gap(18),
                  Expanded(
                    child: TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'New Title',
                      ),
                      cursorColor: cursorColor,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      final day = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2024),
                      );

                      if (time != null && day != null) {
                        setState(() {
                          startDate = day.copyWith(
                            hour: time.hour,
                            minute: time.minute,
                          );
                        });
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: cursorColor,
                          ),
                        ),
                        Text('${startDate?.hour}:${startDate?.minute}'),
                      ],
                    ),
                  ),
                  Gap(135),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      final day = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2024),
                      );

                      if (time != null && day != null) {
                        setState(() {
                          dueDate = day.copyWith(
                            hour: time.hour,
                            minute: time.minute,
                          );
                        });
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'End',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: cursorColor,
                          ),
                        ),
                        Text('${dueDate?.hour}:${dueDate?.minute}'),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(44),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Priority',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: cursorColor,
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        priority = getPriorityEnumValueByIndex(index);
                        onContainerPressed(index);
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 38,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                          color: getPriorityColorByIndex(index),
                          border: Border.all(
                              color: getPriorityBorderColorByIndex(index)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          getPriorityByIndex(index),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gap(20),
              Divider(
                thickness: 0.2,
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  height: 115,
                  decoration: BoxDecoration(
                      color: textFieldBackgroundColor2,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    cursorColor: cursorColor,
                    controller: noteController,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: 'Add a note...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    maxLines: 5,
                    minLines: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 11,
                  ),
                  SvgPicture.asset(AppIcons.location),
                  const SizedBox(
                    width: 11,
                  ),
                  Text(
                    'Add location',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: inactiveColor.withOpacity(0.7)),
                  )
                ],
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 11,
                  ),
                  SvgPicture.asset(AppIcons.addNotification),
                  const SizedBox(
                    width: 11,
                  ),
                  Text(
                    'Add notification',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: inactiveColor.withOpacity(0.7)),
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 40,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFF4B7FD6).withOpacity(0.5),
                ),
                child: MaterialButton(
                  onPressed: () {
                    if (icon == null) {
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          onVisible: () async {
                            await Future.delayed(const Duration(seconds: 3));
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                          content: Text('Icon cannot be null'),
                          actions: [SizedBox()],
                        ),
                      );
                      return;
                    }
                    if (startDate == null) {
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          onVisible: () async {
                            await Future.delayed(const Duration(seconds: 3));
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                          content: const Text('Start date cannot be null'),
                          actions: const [SizedBox()],
                        ),
                      );
                      return;
                    }
                    if (dueDate == null) {
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          onVisible: () async {
                            await Future.delayed(const Duration(seconds: 3));
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                          content: Text('Due date cannot be null'),
                          actions: [SizedBox()],
                        ),
                      );
                      return;
                    }
                    if (priority == null) {
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          onVisible: () async {
                            await Future.delayed(const Duration(seconds: 3));
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                          content: Text('Priority date cannot be null'),
                          actions: [SizedBox()],
                        ),
                      );
                      return;
                    }

                    context.read<TaskBloc>().add(
                          CreateTaskButtonPressed(
                            icon: icon!,
                            title: titleController.text,
                            startDate: startDate!,
                            dueDate: dueDate!,
                            note: noteController.text,
                            priority: priority!,
                            onSuccess: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const HomeScreen()));
                            },
                            onFailure: (errorMessage) {
                              ScaffoldMessenger.of(context).showMaterialBanner(
                                MaterialBanner(
                                  onVisible: () async {
                                    await Future.delayed(
                                        const Duration(seconds: 3));
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentMaterialBanner();
                                  },
                                  content: Text(errorMessage),
                                  actions: const [
                                    SizedBox(),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: cursorColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  String getPriorityByIndex(int index) {
    switch (index) {
      case 0:
        return 'High';
      case 1:
        return 'Medium';
      case 2:
        return 'Low';
      default:
        return '';
    }
  }

  Priority getPriorityEnumValueByIndex(int index) {
    switch (index) {
      case 0:
        return Priority.high;
      case 1:
        return Priority.medium;
      case 2:
        return Priority.low;
      default:
        return Priority.low;
    }
  }

  Color getPriorityColorByIndex(int index) {
    if (selectedContainerIndex == index) {
      switch (index) {
        case 0:
          return const Color(0xFFFF2752);
        case 1:
          return const Color(0xFFF6A845);
        case 2:
          return const Color(0xFF44DB4A);
        default:
          return Colors.white;
      }
    } else {
      return Colors.transparent;
    }
  }

  Color getColorByIndex(int index) {
    switch (index) {
      case 0:
        return const Color(0xFF525298);

      case 1:
        return const Color(0xFFDD8491);
      case 2:
        return const Color(0xFFFF8700);

      default:
        return Colors.white;
    }
  }

  Color getPriorityBorderColorByIndex(int index) {
    switch (index) {
      case 0:
        return const Color(0xFFFF2752);
      case 1:
        return const Color(0xFFF6A845);
      case 2:
        return const Color(0xFF44DB4A);
      default:
        return Colors.white;
    }
  }
}
