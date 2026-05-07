abstract class CalendarEvent {}

class CalendarPreviousMonthPressed extends CalendarEvent {}

class CalendarNextMonthPressed extends CalendarEvent {}

class CalendarDayPressed extends CalendarEvent {
  final DateTime date;
  CalendarDayPressed(this.date);
}