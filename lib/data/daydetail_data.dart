import 'package:flutter/material.dart';

class DayDetail {
  final String time;
  final IconData icon;
  final String title;

  DayDetail({
    required this.time,
    required this.icon,
    required this.title,
  });
}

final mockDayDetails = [
  DayDetail(
    time: "11:00",
    icon: Icons.groups,
    title: "Full Stack Developer",
  ),
  DayDetail(
    time: "14:00",
    icon: Icons.groups,
    title: "Full Stack Developer",
  ),
  DayDetail(
    time: "14:30",
    icon: Icons.groups,
    title: "Frontend Developer",
  ),
  DayDetail(
    time: "16:30",
    icon: Icons.groups,
    title: "Internship Developer",
  ),
  DayDetail(
    time: "09:06",
    icon: Icons.location_on,
    title: "บริษัท - 13.7203526, 100.5599307",
  ),
];