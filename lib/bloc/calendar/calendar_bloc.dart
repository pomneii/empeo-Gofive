import 'package:flutter_bloc/flutter_bloc.dart';

import '../calendar/calendar_event.dart';
import '../calendar/calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc()
    : super(
        CalendarState(
          DateTime(DateTime.now().year, DateTime.now().month),
          DateTime.now(),
        ),
      ) {
    on<CalendarNextMonthPressed>(
      (event, emit) => emit(
        CalendarState(
          DateTime(state.currentMonth.year, state.currentMonth.month + 1),
          state.currentDay,
        ),
      ),
    );

    on<CalendarPreviousMonthPressed>(
      (event, emit) => emit(
        CalendarState(
          DateTime(state.currentMonth.year, state.currentMonth.month - 1),
          state.currentDay,
        ),
      ),
    );

    on<CalendarDayPressed>(
      (event, emit) => emit(
        CalendarState(
          state.currentMonth,
          state.currentDay,
          selectedDate: event.date,
        ),
      ),
    );
  }
}
