import 'dart:math';
import 'dart:ui';

import 'models/priority.dart';

final _random = Random();
var data = <String, dynamic>{
  "tasks": [
    {
      "id": 1,
      "title": "Gym time",
      "icon": "assets/icons/upcoming/gym.svg",
      "priority": Priority.low,
      "note": null,
      "start_date": DateTime(2023, 11, 12, 15, 0),
      "due_date": DateTime(2023, 11, 12, 16, 30),
      "is_checked": false,
      "icon_color": Color(0xFFFF8700),
    },
    {
      "id": 2,
      "title": "Meet the cdevs team",
      "icon": "assets/icons/upcoming/meet.svg",
      "priority": Priority.high,
      "note": "We will discuss the new Tasks of the calendar pages",
      "start_date": DateTime(2023, 11, 12, 17, 0),
      "due_date": DateTime(2023, 11, 12, 17, 30),
      "is_checked": false,
      "icon_color": Color(0xFF22B07D),
    },
    {
      "id": 3,
      "title": "Study for the constitutional judiciary test",
      "icon": "assets/icons/upcoming/study.svg",
      "priority": Priority.medium,
      "note": "We will discuss the new Tasks of the calendar pages",
      "start_date": DateTime(2023, 11, 12, 18, 0),
      "due_date": DateTime(2023, 11, 12, 20, 30),
      "is_checked": false,
      "icon_color": Color(0xFFDD8491),
    },
    {
      "id": 4,
      "title": "Cleaning my room",
      "icon": "assets/icons/all/clean.svg",
      "priority": Priority.medium,
      "note": "We will discuss the new Tasks of the calendar pages",
      "start_date": DateTime(2023, 11, 12, 8, 0),
      "due_date": DateTime(2023, 11, 12, 8, 30),
      "is_checked": false,
      "icon_color": Color(0xFF4B7FD6),
    },
    {
      "id": 5,
      "title": "English Study",
      "icon": "assets/icons/upcoming/study.svg",
      "priority": Priority.medium,
      "note": "Review of the acoustics course lessons",
      "start_date": DateTime(2023, 11, 12, 12, 0),
      "due_date": DateTime(2023, 11, 12, 01, 30),
      "is_checked": false,
      "icon_color": Color(0xFFDD8491),
    },
    {
      "id": 6,
      "title": "Create navigation bar",
      "icon": "assets/icons/all/bag.svg",
      "priority": Priority.medium,
      "note": "I will design a navigation bar for the application I am working on, and choose it with suitable colors ",
      "start_date": DateTime(2023, 11, 12, 10, 0),
      "due_date": DateTime(2023, 11, 12, 11, 0),
      "is_checked": false,
      "icon_color": Color(0xFF525298),
    },
  ],
};
