class CalendarState {
  final DateTime currentMonth;
  final DateTime currentDay;
  final DateTime? selectedDate;

  CalendarState(this.currentMonth, this.currentDay, {this.selectedDate});
}