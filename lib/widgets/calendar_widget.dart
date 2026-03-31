import 'package:flutter/material.dart';

class CalendarDayCell extends StatelessWidget {
  final DateTime date;
  final DateTime currentMonth;
  final String displayText;
  final Color bgColor;
  final bool isWeekend;
  final List<IconData>? activities;
  final VoidCallback onTap;

  const CalendarDayCell({
    super.key,
    required this.date,
    required this.currentMonth,
    required this.displayText,
    required this.bgColor,
    required this.isWeekend,
    required this.activities,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isOtherMonth = date.month != currentMonth.month;

    return GestureDetector(
      onTap: onTap,
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
              Text(
                "${date.day}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isWeekend ? Colors.black : Colors.white,
                ),
              ),

              /// SHIFT TEXT
              Text(
                displayText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isWeekend ? Colors.grey : Colors.white,
                ),
              ),

              /// ACTIVITY ICONS
              SizedBox(
                height: 14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: activities != null
                      ? activities!
                            .map(
                              (icon) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 1,
                                ),
                                child: Icon(
                                  icon,
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
}

class CalendarHeaderRow extends StatelessWidget {
  const CalendarHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    const days = ["จ", "อ", "พ", "พฤ", "ศ", "ส", "อา"];

    return Row(
      children: [
        for (var day in days)
          Expanded(
            child: Center(
              child: Text(
                day,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
      ],
    );
  }
}