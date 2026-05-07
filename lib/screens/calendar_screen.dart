import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/calendar_widget.dart';
import '../data/bottom_data.dart';
import '../models/bottom_items.dart';
import '../data/daydetail_data.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calendar/calendar_bloc.dart';
import '../bloc/calendar/calendar_event.dart';
import '../bloc/calendar/calendar_state.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int selectedIndex = 1;

  List<DateTime> generateCalendar(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    final start = firstDay.subtract(Duration(days: firstDay.weekday - 1));

    final daysInMonth = DateTime(year, month + 1, 0).day;

    final totalCells = firstDay.weekday + daysInMonth > 35 ? 42 : 35;

    return List.generate(
      totalCells,
      (index) => start.add(Duration(days: index)),
    );
  }

  static const thaiMonths = [
    "มกราคม",
    "กุมภาพันธ์",
    "มีนาคม",
    "เมษายน",
    "พฤษภาคม",
    "มิถุนายน",
    "กรกฎาคม",
    "สิงหาคม",
    "กันยายน",
    "ตุลาคม",
    "พฤศจิกายน",
    "ธันวาคม",
  ];

  static const days = ["จ", "อ", "พ", "พฤ", "ศ", "ส", "อา"];

  // add shift bottomsheet
  void showAddShiftSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.40,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Divider(
                color: Colors.grey[300],
                thickness: 4,
                indent: MediaQuery.of(context).size.width * 0.35,
                endIndent: MediaQuery.of(context).size.width * 0.35,
              ),
              const SizedBox(height: 10),
              ...shiftDetails.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: BottomItems(icon: item.icon, title: item.title),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // detail bottomsheet
  void showShiftDetails() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.65,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Divider(
                color: Colors.grey[300],
                thickness: 4,
                indent: MediaQuery.of(context).size.width * 0.35,
                endIndent: MediaQuery.of(context).size.width * 0.35,
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "คำอธิบายสัญลักษณ์",
                  style: TextStyle(
                    fontFamily: "Prompt",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF010D57),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    ...detailMenus.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: BottomItems(icon: item.icon, title: item.title),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // open bottomsheet
  void openBottomSheet(DateTime date) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.45,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Divider(
                color: Colors.grey[300],
                thickness: 4,
                indent: MediaQuery.of(context).size.width * 0.35,
                endIndent: MediaQuery.of(context).size.width * 0.35,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              "${days[date.weekday - 1]}. ${date.day} ${thaiMonths[date.month - 1]} ${date.year + 543}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.arrowUpRightFromSquare,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: const Text("เข้างาน 11.00"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: ListView(
                  children: mockDayDetails
                      .map((item) => buildDetailItem(item))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalendarBloc, CalendarState>(
      listenWhen: (previous, current) => current.selectedDate != null,
      listener: (context, state) {
        if (state.selectedDate?.day == 10) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("วันที่ 10!"),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          final month = state.currentMonth;
          final day = state.currentDay;

          return Scaffold(
            appBar: AppBar(
              leading: const SizedBox(),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.read<CalendarBloc>().add(
                      CalendarPreviousMonthPressed(),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${thaiMonths[month.month - 1]} ${month.year + 543}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => context.read<CalendarBloc>().add(
                      CalendarNextMonthPressed(),
                    ),
                    child: const Icon(Icons.arrow_forward_ios, size: 18),
                  ),
                ],
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              actions: [
                GestureDetector(
                  onTap: showShiftDetails,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Icon(
                      Icons.question_mark,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Center(
                  child: GestureDetector(
                    onTap: showAddShiftSheet,
                    child: const Icon(Icons.add, size: 28, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const CalendarHeaderRow(),
                    const SizedBox(height: 10),
                    _buildCalendar(month, day),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// calendar grid
  Widget _buildCalendar(DateTime month, DateTime currentDay) {
    final days = generateCalendar(month.year, month.month);

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisExtent: 75,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: days.length,
        itemBuilder: (context, index) {
          return buildDayCell(days[index], month, currentDay);
        },
      ),
    );
  }

  /// calendar cell
  Widget buildDayCell(
    DateTime date,
    DateTime currentMonth,
    DateTime currentDay,
  ) {
    bool isOtherMonth = date.month != currentMonth.month;
    bool isWeekend = date.weekday >= 6;

    final shift = mockShifts[date];
    final activities = mockActivities[date];

    String displayText;
    Color bgColor;

    if (shift != null) {
      displayText = shift.name;
      bgColor = shift.color;
    } else if (isWeekend) {
      displayText = "OFF";
      bgColor = Colors.white;
    } else {
      displayText = "GO5";
      bgColor = const Color(0xFFE8541A);
    }

    return GestureDetector(
      onTap: () => {
        context.read<CalendarBloc>().add(CalendarDayPressed(date)),
        openBottomSheet(date),
      },
      child: Opacity(
        opacity: isOtherMonth ? 0.5 : 1,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// DAY
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      date.day == currentDay.day &&
                          date.month == currentDay.month &&
                          date.year == currentDay.year
                      ? Colors.white
                      : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    "${date.day}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color:
                          date.day == currentDay.day &&
                              date.month == currentDay.month &&
                              date.year == currentDay.year
                          ? Colors
                                .black // ← font สีดำ
                          : isWeekend
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),

              /// SHIFT / OFF
              if (displayText.isNotEmpty)
                Text(
                  displayText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isWeekend ? Colors.grey : Colors.white,
                  ),
                ),

              SizedBox(
                height: 14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: activities != null
                      ? activities
                            .map(
                              (a) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 1,
                                ),
                                child: Icon(
                                  a.icon,
                                  size: 16,
                                  color: isWeekend
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            )
                            .toList()
                      : [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailItem(DayDetail item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 55,
            child: Text(
              item.time,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),

          const SizedBox(width: 8),

          Icon(item.icon, size: 18, color: Colors.blueGrey),

          const SizedBox(width: 10),

          Expanded(
            child: Text(item.title, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

/// shift model
class Shift {
  final String name;
  final Color color;

  Shift(this.name, this.color);
}

/// mock shift data
final mockShifts = {DateTime(2026, 2, 10): Shift("G07", Colors.blue)};

class CalendarActivity {
  final IconData icon;

  CalendarActivity(this.icon);
}

final mockActivities = {
  DateTime(2026, 3, 5): [CalendarActivity(Icons.event)],
  DateTime(2026, 3, 10): [
    CalendarActivity(Icons.more_time_sharp),
    CalendarActivity(Icons.calendar_month_outlined),
  ],
  DateTime(2026, 3, 14): [CalendarActivity(Icons.cake_outlined)],
  DateTime(2026, 3, 18): [CalendarActivity(Icons.swap_horiz_outlined)],
};
