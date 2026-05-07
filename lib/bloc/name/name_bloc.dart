import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/name_data.dart';
import '../name/name_event.dart';
import '../name/name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc() : super(NameInitial()) {
    on<SearchNameEvent>((event, emit) {
      final query = event.query.toLowerCase();

      final filtered = team.where((member) {
        return member["name"]!.toLowerCase().contains(query) ||
            member["role"]!.toLowerCase().contains(query);
      }).toList();

      emit(NameLoaded(filtered));
    });
  }
}