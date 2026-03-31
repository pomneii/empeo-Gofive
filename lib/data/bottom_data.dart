import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import '../models/bottom_items.dart';

final detailMenus = [
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.userClock, color: Colors.black, size: 16),
    title: "สถานะการทำงานผิดปกติ",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.clock, color: Colors.black, size: 16),
    title: "ทำงานล่วงเวลา",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.book, color: Colors.black, size: 16),
    title: "เอกสาร",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.calendarAlt, color: Colors.black, size: 16),
    title: "กิจกรรม",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.bullhorn, color: Colors.black, size: 16,),
    title: "ประกาศ",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.exchangeAlt, color: Colors.black, size: 16,),
    title: "สลับกะ",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.userGroup, color: Colors.black, size: 16,),
    title: "นัดสัมภาษณ์",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.birthdayCake, color: Colors.black, size: 16,),
    title: "วันเกิด",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.handshake, color: Colors.black, size: 16,),
    title: "เริ่มงานวันแรก",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.leaf, color: Colors.black, size: 16,),
    title: "สิ้นสุดการทำงาน",
  ),
];

final shiftDetails = [
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.userGroup, color: Color(0xFFE8541A), size: 18,),
    title: "ลางาน",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.userTie, color: Color(0xFFE8541A), size: 18,),
    title: "ปฏิบัติงานนอกสถานที่",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.userClock, color: Color(0xFFE8541A), size: 18,),
    title: "ล่วงเวลา",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.handHoldingDollar, color: Color(0xFFE8541A), size: 18,),
    title: "รับรองเวลา",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.piggyBank, color: Color(0xFFE8541A), size: 18,),
    title: "ขอสะสมเวลา",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.rotate, color: Color(0xFFE8541A), size: 18,),
    title: "แลกเวลา",
  ),
  BottomItems(
    icon: const FaIcon(FontAwesomeIcons.moneyBillWave, color: Color(0xFFE8541A), size: 18,),
    title: "ค่าใช้จ่าย",
  ),
];
